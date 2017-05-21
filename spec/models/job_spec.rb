require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      before(:each) do
        @category = create(:category)
      end

      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: @category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: @category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: @category.id)
        expect(job).to be_invalid
      end

      it "is invalid without a job category" do
        job = Job.new(title: "Developer", level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title and level of interest" do
        category = create(:category)
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      category = create(:category)
      job = create(:job, category_id: category.id)
      expect(job).to respond_to(:company)
      expect(job).to respond_to(:category)
      expect(job).to respond_to(:comments)
    end
  end
end
