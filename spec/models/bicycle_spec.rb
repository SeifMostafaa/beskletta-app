require 'rails_helper'

RSpec.describe Bicycle, type: :model do
  subject { Bicycle.new(name: "Rspec Bicycle", description: "Rspec Bicycle Description", price: 678, 
                        style: "Rspec Bicycle Style", photo: File.open(Rails.root + ("app/assets/images/img-6.png")))}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a style" do
    subject.style=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a photo" do
    subject.photo=nil
    expect(subject).to_not be_valid
  end
end
