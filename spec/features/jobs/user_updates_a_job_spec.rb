require 'rails_helper'

RSpec.describe "A user can update a job" do
  it "when they click on the update button" do
    company = create(:company)
    category = create(:category)
    job = company.jobs.create!(title: "Developer", description: "Yippee", level_of_interest: 50, city: "Denver", category_id: category.id)

    visit company_path(company)
    expect(page).to have_content "Developer"

    click_on "Developer"

    click_on "Update"

    fill_in "job[title]", with: "Ass Kicker"
    fill_in "job[description]", with: "Most Visciously"
    fill_in "job[level_of_interest]", with: 70
    fill_in "job[city]", with: "San Francisco"
    click_on "Update Job"

    expect(page).to have_content "Ass Kicker"
    expect(page).to have_content "Most Visciously"
    expect(page).to have_content "70"
    expect(page).to have_content "San Francisco"
  end
end
