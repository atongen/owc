require 'spec_helper'

module Refinery
  module Staffs
    describe Staff do
      describe "validations" do
        subject do
          FactoryGirl.create(:staff,
          :full_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:full_name) { should == "Refinery CMS" }
      end
    end
  end
end
