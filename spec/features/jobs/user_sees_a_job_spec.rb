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

  scenario "a user can see comments on a specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    comment = job.comments.create(content: "All is quiet on the western front")

    visit company_job_path(company, job)

    expect(page).to have_css('h3', "Comments")
    expect(page).to have_content("All is quiet on the western front")
  end


  # scenario "a user can add a comment to a specific job" do
  #   company = Company.create!(name: "ESPN")
  #   job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
  #   comment = job.comments.create(content: "All is quiet on the western front")
  #
  #   visit company_job_path(company, job)
  #
  #   expect(page).to have_css('h3', "Add a Comment")
  #   fill_in "comment[content]", with: "Spoke to hiring manager, Jacob. Plan to follow up Monday"
  #   click_on "Add Comment"
  #
  #   expect(current_path).to be(company_job_path(company, job))
  #
  #   expect(page).to have_content("Spoke to hiring manager, Jacob. Plan to follow up Monday")
  # end
end
