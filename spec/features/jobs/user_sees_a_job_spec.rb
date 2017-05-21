require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company)
    category = create(:category)
    job = company.jobs.create!(title: "Developer", description: "Yippee", level_of_interest: 50, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
  end
end
