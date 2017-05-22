require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = create(:company)
    category = create(:category)
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(page).to have_css('h4', "Jobs")
    expect(page).to have_content("All Jobs for #{company.name}")
    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")

    expect(page).to have_link("Add a New Job", href: "/companies/#{company.id}/jobs/new")
  end

  scenario "a user can see a contact for a company" do
    company = create(:company)
    contact = create(:contact, company_id: company.id)

    visit company_path(company)

    expect(page).to have_css('h4', "Contacts: ")
    expect(page).to have_content(contact.full_name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end

  scenario "a user can add a contact to a company" do
    company = create(:company)

    visit company_path(company)

    click_on "Add a Contact"
    expect(page).to have_css('h3', "Add a Contact")

    fill_in "contact[full_name]", with: "Amanda Palmer"
    fill_in "contact[position]", with: "Director"
    fill_in "contact[email]", with: "afp@afpenterprises.com"
    click_on "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Amanda Palmer")
    expect(page).to have_content("Director")
    expect(page).to have_content("afp@afpenterprises.com")
  end
end
