require 'rails_helper'

RSpec.describe "A user sees a list of all categories" do
  it "when they first get to the categories page" do
    category1 = Category.create(title: "Cat Herder")
    category2 = Category.create(title: "Musician")

    visit categories_path

    expect(page).to have_css('h3', "All Categories")
    expect(page).to have_link("Create a New Category", href: new_category_path)
    expect(page).to have_content("Cat Herder")
    expect(page).to have_content("Musician")
  end

  it "they can delete a category on the page" do
    category = Category.create(title: "Cat Herder")

    visit categories_path

    expect(page).to have_content("Cat Herder")
    click_on "Delete"
    expect(page).to_not have_content("Cat Herder")

  end
end
