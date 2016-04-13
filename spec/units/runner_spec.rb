require 'rails_helper'


class ViewMock
  MockProduct = Struct.new('Product', :name, :category)

  include Bread::View
  def initialize
    @product = MockProduct.new("Foo")
  end
  def controller_path
    'products'
  end
  def action_name
    'show'
  end
  def products_path
  end
  def product_path(*args)
  end
  def controller
  end
end

RSpec.describe Bread::Runner do
  let(:view) { ViewMock.new }
  subject { Bread::Runner.new(view) }

  describe ".initialize" do
    it "calls reload!" do
      expect(Bread).to receive(:reload!)
      subject
    end
  end

  describe ".run" do
    it "does not raise errors" do
      expect { subject.run }.not_to raise_error
    end

    it "is called from view.bread" do
      expect_any_instance_of(Bread::Runner).to receive(:run).and_call_original
      view.bread
    end

    it "fills crumbs in the view" do
      expect {
        view.bread
      }.to change { view.send(:bread_array).map(&:title) }.from([]).to(["Home", "Products", "Foo"])
    end
  end

end
