module Bread
  class Manager
    class Crumbs
      class TopScope

        def initialize
          @crumb_blocks = {}
        end

        def crumb(token, &block)
          @crumb_blocks[token] = block
          true
        end

        def get_crumb_block(token)
          @crumb_blocks[token] || raise("no crumb block for: :#{token}")
        end




      end
    end
  end
end
