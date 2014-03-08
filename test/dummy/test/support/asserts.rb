

# http://guides.rubyonrails.org/testing.html#available-assertions
# http://edgeguides.rubyonrails.org/testing.html#rails-specific-assertions



  def assert_crumb(text)
    if response.present?
      assert_select("ul#breadcrumbs li a", text, get_clean_response_body_error(text))
    else
      result = page.all("ul#breadcrumbs li a", text: text)
      case result.count
      when 0
        assert(false, get_clean_response_body_error(text))
      when 1
        assert(true)
      else
        assert(false, get_clean_response_body_error(text))
      end

    end
  end

  def get_clean_response_body
    if response.present?
      response
    else
      page
    end.body.gsub("\n", '').gsub(' ', '')
  end

  def get_clean_response_body_error(text)
    "<li><a>#{text.magenta}</a></li> should be included exactly once in #{get_clean_response_body.blue} but wasn't"
  end



