module Refinery
  module FeaturedItems
    module Admin
      class FeaturedItemsController < ::Refinery::AdminController
        include Refinery::FeaturedItems::Admin::FeaturedItemsHelper

        before_filter :validate_model, :only => [:model_items]

        crudify :'refinery/featured_items/featured_item', :xhr_paging => true

        def model_items
          items = @klass.order(:title).all

          respond_to do |format|
            format.json { render :json => {:success => true, :items => items.as_json(:only => [:id, :title]) } }
          end
        end

        protected

        def validate_model
          @klass = namespaced_model(params[:model])

          if @klass.nil?
            respond_to do |format|
              format.json { render :json => {:success => false, :message => 'Invalid model', :items => [] } }
            end
          end
        end
      end
    end
  end
end
