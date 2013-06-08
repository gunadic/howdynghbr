require 'spec_helper'

describe Review do

  it{should belong_to(:participation)}

  it "must provide a rating" do
    temp = FactoryGirl.build(:review, :rating => nil)
    expect(temp).to_not be_valid
  end

end
