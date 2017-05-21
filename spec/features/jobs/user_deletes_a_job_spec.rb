require 'rails_helper'

RSpec.describe "A user can delete a job" do
  it "from the jobs listings on a company page" do
    company = create(:company)
    job = company.jobs.create!(title: "Developer", description: "Yippee", level_of_interest: 50, city: "Denver")

    visit company_path(company)

    expect(page).to have_content job.title

    click_on "Delete"

    expect(page).to_not have_content job.title
  end
end
