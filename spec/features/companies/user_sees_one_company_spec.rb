require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = create(:company)
    category = create(:category)
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(page).to have_content("All Jobs for #{company.name}")
    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")

    expect(page).to have_link("Add a New Job", href: "/companies/#{company.id}/jobs/new")
  end
end
