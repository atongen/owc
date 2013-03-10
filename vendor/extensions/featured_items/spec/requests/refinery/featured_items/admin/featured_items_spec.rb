# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FeaturedItems" do
    describe "Admin" do
      describe "featured_items" do
        login_refinery_user

        describe "featured_items list" do
          before do
            FactoryGirl.create(:featured_item, :title => "UniqueTitleOne")
            FactoryGirl.create(:featured_item, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.featured_items_admin_featured_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.featured_items_admin_featured_items_path

            click_link "Add New Featured Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::FeaturedItems::FeaturedItem.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::FeaturedItems::FeaturedItem.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:featured_item, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.featured_items_admin_featured_items_path

              click_link "Add New Featured Item"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::FeaturedItems::FeaturedItem.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:featured_item, :title => "A title") }

          it "should succeed" do
            visit refinery.featured_items_admin_featured_items_path

            within ".actions" do
              click_link "Edit this featured item"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:featured_item, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.featured_items_admin_featured_items_path

            click_link "Remove this featured item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::FeaturedItems::FeaturedItem.count.should == 0
          end
        end

      end
    end
  end
end
