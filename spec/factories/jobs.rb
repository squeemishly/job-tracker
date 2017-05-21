FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "Cat Herder #{i}"
    end

    description "Yippee"

    level_of_interest 50

    city "Denver"

    company

    category
  end
end
