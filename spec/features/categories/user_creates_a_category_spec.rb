require 'rails_helper'

RSpec.describe "A user can create a new category" do
  it "when they click New Category on the categories index" do
    visit categories_path

    click_on "Create a New Category"
    expect(current_path).to eq(new_category_path)

    fill_in "category[title]", with: "Development"
    click_on "Create Category"

    expect(page).to have_content "Development"
  end
end
