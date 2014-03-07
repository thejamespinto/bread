class ProductPhoto < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :name, :product
  validates_length_of :name, minimum: 3

  def unchanged_name
    changes['name'].to_a.first || name
  end

end
