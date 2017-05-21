require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company)
    category = create(:category)
    company.jobs.create!(title: "Developer", description: "Yippee", level_of_interest: 50, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", description: "Hooray", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end
