module StackMaster
  module Commands
    class Apply
      include Command
      include Commander::UI

      def initialize(config, region_or_alias, stack_name)
        @config = config
        @region_or_alias = region_or_alias
        @stack_name = stack_name
      end

      def perform
      end
    end
  end
end
