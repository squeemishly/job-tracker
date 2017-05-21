require 'rails_helper'

RSpec.describe "A user sees a list of all categories" do
  it "when they first get to the categories page" do
    category1 = create(:category)
    category2 = create(:category)
    # category1 = Category.create(title: "Cat Herder")
    # category2 = Category.create(title: "Musician")

    visit categories_path

    expect(page).to have_css('h3', "All Categories")
    expect(page).to have_link("Create a New Category", href: new_category_path)
    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end

  it "they can delete a category on the page" do
    category = create(:category)

    visit categories_path

    expect(page).to have_content(category.title)
    click_on "Delete"
    expect(page).to_not have_content(category.title)

  end
end
