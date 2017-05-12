class Task < ApplicationRecord
  validates :name, presence: true
  validates :list_id, presence: true
  belongs_to :list
  has_many :tags

  def self.updated_recently_first
    self.all.reorder(:updated_at)
  end
end
