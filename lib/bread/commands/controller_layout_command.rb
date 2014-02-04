module Bread
  class ControllerLayoutCommand

    attr_reader :keys

    def initialize(controller)
      IvarsCommand.new(controller).ivars.each do |key, ivar|
        self.instance_variable_set(key, ivar)
      end
      
      @controller = controller
      @actions = {}
      @keys = []
    end

    def actions(*action_names, &block)
      action_names.each do |action_name|
        @actions[action_name] = block
        is_current_action = action_name.to_s == @controller.action_name

        if is_current_action
          self.instance_eval(&block)
          # teria que ter um break aqui, que tambem pare todos os registros de proximas actions =D
        end
      end
    end

    def crumbs(*keys)
      parent = nil
      if keys.last.is_a? Hash
        options = keys.last
        keys.delete(options)
        #raise "Unexpected options: #{}"
        parent = options[:parent]
      end
      @keys = keys + @keys
      if parent
        blk = @actions[parent]
        instance_eval(&blk)
      end
    end

  end
end