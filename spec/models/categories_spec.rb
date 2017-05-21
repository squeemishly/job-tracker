require 'rails_helper'

RSpec.describe Category do
  it "has a title" do
    category = Category.create(title: "Inspector")

    expect(category).to be_valid
  end

  it "must have a title" do
    category = Category.create

    expect(category).to be_invalid
  end

  it "must have a unique title" do
    category = Category.create(title: "Inspector")
    category2 = Category.create(title: "Inspector")

    expect(category).to be_valid
    expect(category2).to be_invalid
  end

  it "has relationships" do
    category = create(:category)
    expect(category).to respond_to(:jobs)
  end
end
