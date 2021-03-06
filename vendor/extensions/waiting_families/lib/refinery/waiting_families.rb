require 'refinerycms-core'

module Refinery
  autoload :WaitingFamiliesGenerator, 'generators/refinery/waiting_families_generator'

  module WaitingFamilies
    require 'refinery/waiting_families/engine'
    require 'refinery/waiting_families/tab'

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
