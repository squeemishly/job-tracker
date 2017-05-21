FactoryGirl.define do
  factory :company do
    sequence :name do |i|
      "Xena Corp #{i}"
    end
  end
end
