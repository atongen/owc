module Refinery
  module Events
    class EventsController < ::ApplicationController

      def index
        @events = Event.order('position ASC')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        @page = ::Refinery::Page.where(:link_url => "/events").first
        present(@page)
      end

      def upcoming
        @events = Event.where("date(start_date) >= ?", Date.today)
        @page = ::Refinery::Page.where(:link_url => "/events/upcoming").first
        present(@page)
        render :action => :index
      end

      def past
        @events = Event.where("date(start_date) < ?", Date.today)
        @page = ::Refinery::Page.where(:link_url => "/events/past").first
        present(@page)
        render :action => :index
      end

    end
  end
end
