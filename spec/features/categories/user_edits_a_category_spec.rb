require 'rails_helper'

RSpec.describe "A user can edit a category" do
  it "when they click edit from the home page" do
    category = create(:category)

    visit categories_path
    click_on "Edit"

    expect(page).to have_css('h3', "Edit #{category.title}")
    fill_in "category[title]", with: "Space"
    click_on "Update Category"

    expect(page).to have_css('h3', "Space")
    expect(page).to have_link('Return to Categories List', href: categories_path)
  end

  it "when they click edit from the view page" do
    category = create(:category)

    visit category_path(category)
    click_on "Edit"

    expect(page).to have_css('h3', "Edit #{category.title}")
    fill_in "category[title]", with: "Space"
    click_on "Update Category"

    expect(page).to have_css('h3', "Space")
    expect(page).to have_link('Return to Categories List', href: categories_path)
  end
end
