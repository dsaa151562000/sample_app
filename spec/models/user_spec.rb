require 'spec_helper'

describe User do

 before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end



subject { @user }


  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

 describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
