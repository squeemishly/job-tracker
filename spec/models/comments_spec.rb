require 'rails_helper'

RSpec.describe Comment do
  it "has a content field" do
    comment = create(:comment)

    expect(comment.content).to eq("Things! And stuff!")
  end

  it "has relationships" do
    comment = create(:comment)

    expect(comment).to respond_to(:job)
  end
end
