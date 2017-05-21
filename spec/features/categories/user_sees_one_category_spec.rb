require 'rails_helper'

RSpec.describe "A user can see a single category" do
  it "when they click ont he category name from the index" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company_id: company.id, category_id: category.id)
    
    visit categories_path
    click_on category.title

    expect(page).to have_css('h3', text: category.title)
    expect(page).to have_css('h5', text: "Jobs in #{category.title} category")
    expect(page).to have_link(job.title, href: company_job_path(company, job))
    expect(page).to have_link('Return to Categories List', href: categories_path)
  end
end
