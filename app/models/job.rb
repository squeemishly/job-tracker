class Job < ActiveRecord::Base
  validates   :title, presence: true
  validates   :level_of_interest, presence: true
  validates   :city, presence: true
  validates   :category_id, presence: true
  belongs_to  :company
  belongs_to  :category
  has_many    :comments
end
