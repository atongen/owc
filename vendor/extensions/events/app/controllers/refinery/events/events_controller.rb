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

      def show
        @event = Event.find(params[:id])
        if @event.start_date >= Date.today
          redirect_to "/events/upcoming"
        else
          redirect_to "/events/past"
        end
      end

      def upcoming
        @events = Event.where("date(start_date) >= ? and date(start_date) is not null and date(end_date) is not null", Date.today)
       # @events = @events.select { |n| !n.body.blank? && n.event_images.count > 0 }
        @page = ::Refinery::Page.where(:link_url => "/events/upcoming").first
        present(@page)
        render :action => :index
      end

      def past
        #@events = Event.where("date(start_date) < ? and date(start_date) is not null and date(end_date) is not null and body is not null", Date.today)
        #@events = @events.select { |n| !n.body.blank? && n.event_images.count > 0 }
        @events = Event.where("date(start_date) is not null and date(start_date) < ?", Date.today)
        @page = ::Refinery::Page.where(:link_url => "/events/past").first
        present(@page)
        render :action => :index
      end

    end
  end
end
