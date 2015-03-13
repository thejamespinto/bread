class Category < ActiveRecord::Base

  # for testing purposes this app does not permit destroying it's models
  before_destroy do
    false
  end
end
