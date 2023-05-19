require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  subject { AdminUser.create(email: "rspec_admin@example.com", password: 'password', password_confirmation: 'password')}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
end
