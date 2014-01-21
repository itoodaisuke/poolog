require 'spec_helper'

describe Place do
  it "is valid with name" do
    place = Place.new(
      name: 'hoge'
    )
    expect(place).to be_valid
  end

  it "is invalid without a name" do
    expect(Place.new(name: nil)).to have(1).errors_on(:name)
  end
end
