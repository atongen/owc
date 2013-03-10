class AddColorToCarouselImages < ActiveRecord::Migration
  def change
    add_column :refinery_carousel_images, :color, :string
  end
end
