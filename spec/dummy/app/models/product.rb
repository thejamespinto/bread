class Product < ActiveRecord::Base
  belongs_to :category
  has_many :photos

  validates_presence_of :name
  validates_length_of :name, minimum: 3

  # for testing purposes this app does not permit destroying it's models
  before_destroy do
    false
  end
end
