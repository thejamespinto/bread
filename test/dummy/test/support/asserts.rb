

# http://guides.rubyonrails.org/testing.html#available-assertions
# http://edgeguides.rubyonrails.org/testing.html#rails-specific-assertions



  def assert_crumb(text)
    assert_select("li a", text, "<li><a>#{text.magenta}</a></li> should be included in #{get_clean_response_body.blue} but wasn't")
  end

  def get_clean_response_body
    response.body.gsub("\n", '').gsub(' ', '')
  end



