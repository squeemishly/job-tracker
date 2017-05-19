require 'rails_helper'

RSpec.describe "A user can see a single category" do
  it "when they click ont he category name from the index" do
    category = Category.create(title: "Science")

    visit categories_path
    click_on "Science"

    expect(page).to have_css('h1', text: category.title)
  end
end
