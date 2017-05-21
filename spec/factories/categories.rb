FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "Training #{i}"
    end
  end
end
