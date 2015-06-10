require 'rails_helper'

describe Item do
  describe "create methods" do

    before do
      @item = Item.create(name: "Example Task")
    end

    describe "item_creation" do
      it "creates to-do items" do
        expect( @item ).to be_a Item
      end
    end
  end
end
