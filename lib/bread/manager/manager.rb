module Bread
  class Manager
    include Singleton

    def actions
      @actions ||= Actions.new
    end

    def crumbs
      @crumbs ||= Crumbs.new
    end

  end
end
