require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company = create(:company)
    company_two = create(:company)

    visit companies_path

    expect(page).to have_link("Add a New Company", href: new_company_path)

    expect(page).to have_css('h3', "All Companies")
    expect(page).to have_content(company.name)
    expect(page).to have_content(company_two.name)
  end

end
