module Bread
  module Helper

    def bread
      return @bread if @bread

      tmp = nil
      controller._bread_trees.each do |i_action, hash|
        if i_action.to_s == action_name
          tmp = hash
          break
        end
      end

      @bread =  if tmp.nil?
                  puts "No Bread for this Action. Please check https://github.com/yakko/bread for more info".light_yellow
                  []
                else
                  list = []
                  while tmp
                    arr = controller.instance_eval(&tmp[:block])
                    list << {title: arr.first, path: arr.second}
                    tmp = tmp[:parent]
                  end
                  list.reverse
                end
    end

  end
end

if defined? ActionView::Base
  ActionView::Base.class_eval do
    include Bread::Helper
  end
end