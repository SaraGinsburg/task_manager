class List < ApplicationRecord
  validates :name, presence: true
  has_many :tasks
  has_many :shared_lists
  has_many :users, through: :shared_lists
end
