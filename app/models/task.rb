class Task < ApplicationRecord
  validates :name, :list_id, presence: true
  belongs_to :list
end
