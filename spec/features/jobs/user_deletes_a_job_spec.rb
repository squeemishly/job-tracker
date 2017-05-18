require 'rails_helper'

RSpec.describe "A user can delete a job" do
  it "from the jobs listings on a company page" do
    company1 = Company.create(name: "afp enterprises")
    company1.jobs.create!(title: "Developer", description: "Yippee", level_of_interest: 50, city: "Denver")

    visit company_path(company1)

    expect(page).to have_content "Developer"

    click_on "Delete"

    expect(page).to_not have_content "Developer"
  end
end
