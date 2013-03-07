#!/usr/bin/env ruby

require 'yaml'

env = ARGV[0] || "production"
APP_HOME = File.expand_path(File.join(File.dirname(__FILE__), ".."))
config = YAML.load_file(File.join(APP_HOME, "config", "database.yml"))[env]

PGSQL = %x{ which psql }.to_s.strip
if PGSQL == ""
  puts "psql is required in PATH"
  exit 1
end

params = {

  "database" => "--dbname",
  "host"     => "--host",
  "username" => "--username",
  "port"     => "--port"

}.map do |key,value|
  "#{value}=#{config[key]}" if config[key].to_s.strip != ""
end.join(" ")

if config["password"].to_s.strip != ""
  cmd_env = "PGPASSWORD=\"#{config["password"]}\" "
else
  cmd_env = ""
end

cmd = "#{cmd_env}#{PGSQL} -qAtw #{params} -c \"VACUUM ANALYZE\""

#puts cmd

%x{ #{cmd} }
