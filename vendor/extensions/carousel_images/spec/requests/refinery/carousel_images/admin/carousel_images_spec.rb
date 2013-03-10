# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CarouselImages" do
    describe "Admin" do
      describe "carousel_images" do
        login_refinery_user

        describe "carousel_images list" do
          before do
            FactoryGirl.create(:carousel_image, :title => "UniqueTitleOne")
            FactoryGirl.create(:carousel_image, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.carousel_images_admin_carousel_images_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.carousel_images_admin_carousel_images_path

            click_link "Add New Carousel Image"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CarouselImages::CarouselImage.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::CarouselImages::CarouselImage.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:carousel_image, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.carousel_images_admin_carousel_images_path

              click_link "Add New Carousel Image"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CarouselImages::CarouselImage.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:carousel_image, :title => "A title") }

          it "should succeed" do
            visit refinery.carousel_images_admin_carousel_images_path

            within ".actions" do
              click_link "Edit this carousel image"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:carousel_image, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.carousel_images_admin_carousel_images_path

            click_link "Remove this carousel image forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CarouselImages::CarouselImage.count.should == 0
          end
        end

      end
    end
  end
end
