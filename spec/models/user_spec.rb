require 'rails_helper'

describe User do
  describe "user methods" do

    before do
      @user = User.create(name: "Admin", email: "admin@example.com", password: "bullseye")
    end

    describe "user_creation" do
      it "creates a user" do
        expect( @user ).to be_a User
      end
    end
  end
end
