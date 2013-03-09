require 'spec_helper'

module Refinery
  module WaitingFamilies
    describe WaitingFamily do
      describe "validations" do
        subject do
          FactoryGirl.create(:waiting_family)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
