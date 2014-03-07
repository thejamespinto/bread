class Product < ActiveRecord::Base
  has_many :product_photos, dependent: :restrict_with_error
  validates_presence_of :name
  validates_length_of :name, minimum: 3

  def unchanged_name
    changes['name'].to_a.first || name
  end

end
