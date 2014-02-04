module Bread
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_install
        template "skeleton.rb", "config/breadcrumbs.rb"
      end
    end
  end
end

