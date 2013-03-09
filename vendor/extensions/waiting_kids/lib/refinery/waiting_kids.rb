require 'refinerycms-core'

module Refinery
  autoload :WaitingKidsGenerator, 'generators/refinery/waiting_kids_generator'

  module WaitingKids
    require 'refinery/waiting_kids/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
