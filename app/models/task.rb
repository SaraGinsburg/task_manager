class Task < ApplicationRecord
  validates :name, :list_id, presence: true
  belongs_to :list

  def self.updated_recently_first
    self.all.reorder(:updated_at)
  end
end
