require 'rails_helper'

module FooBar
end

RSpec.describe Bread do

  describe ".add_module(mod)" do
    it "works with modules" do
      expect {
        expect {
          Bread.add_module(FooBar)
        }.not_to raise_error
      }.to change { Bread::Configuration.ancestors }
    end

    it "does not work with classes" do
      expect {
        expect {
          Bread.add_module(Class.new)
        }.to raise_error(TypeError)
      }.not_to change { Bread::Configuration.ancestors }
    end
  end

end
