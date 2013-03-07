#!/usr/bin/env ruby

require 'yaml'

env = ARGV[0] || "production"

APP_HOME = File.expand_path(File.join(File.dirname(__FILE__), ".."))

dir = ARGV[1] || File.join(APP_HOME, "bak")

config = YAML.load_file(File.join(APP_HOME, "config", "database.yml"))[env]

PG_DUMP = %x{ which pg_dump }.to_s.strip
if PG_DUMP == ""
  puts "pg_dump is required in PATH"
  exit 1
end

database = config["database"].to_s.strip

if database == ""
  puts "No database specified by config file."
  exit 1
end

outfile = File.join(dir, "#{Time.now.strftime('%Y%m%d%H%M%S')}-#{database}.dump")

params = {

  "host" => "--host",
  "username" => "--username"

}.map do |key,value|
  "#{value}=#{config[key]}" if config[key].to_s.strip != ""
end.join(" ")

if config["password"].to_s.strip != ""
  cmd_env = "PGPASSWORD=#{config["password"]} "
else
  cmd_env = ""
end

cmd = "#{cmd_env}#{PG_DUMP} -v -wO -Fc --no-acl --no-owner #{params} #{database} > \"#{outfile}\""

%x{ #{cmd} }
puts outfile
