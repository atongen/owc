#!/usr/bin/env ruby

require File.expand_path(File.join('..', '..', 'config', 'environment'), __FILE__)

PART_MAP = {
  "First Full Width"  => "r1c1",
  "Left 2 Col"        => "r2c1",
  "Right 2 Col"       => "r2c2",
  "Second Full Width" => "r3c1",
  "Left 3 Col"        => "r4c1",
  "Middle 3 Col"      => "r4c2",
  "Right 3 Col"       => "r4c3",
  "Third Full Width"  => "r5c1"
}

Refinery::Page.all.each do |page|
  puts page.slug

  if page.slug == 'home'
    page.view_template = 'home'
  elsif page.slug.present?
    page.view_template = 'show'
  end
  page.save! if page.changed?

  # Convert existing parts with old names
  page.parts.all.each do |part|
    if PART_MAP.has_key?(part.title)
      part.title = PART_MAP[part.title]
      part.save!
    end
  end

  # Add missing page parts
  Refinery::Pages.default_parts.each_with_index do |page_part, index|
    if part = page.parts.where(:title => page_part).first
      part.position = index
    else
      part = Refinery::PagePart.new(:title => page_part, :position => index)
      part.page = page
    end
    part.save!
  end
end
