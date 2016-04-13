module Bread
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def config_file
        copy_file "config.rb", "config/breadcrumbs.rb"
      end

      def inject_html
        destination_path = 'app/views/layouts/application.html.erb'
        template_path = File.join(File.expand_path('../templates', __FILE__), "view.html.erb")
        html = open(template_path).read
        after_regex = /<body(.*)>/i

        inject_into_file destination_path, html, after: after_regex

      rescue Errno::ENOENT
        puts "\tGENERATOR HAS FAILED"
        puts "\tINSERT THIS BLOCK ON #{destination_path}".red
        puts html.green
      end

    end
  end
end

