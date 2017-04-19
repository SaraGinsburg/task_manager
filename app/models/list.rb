class List < ApplicationRecord
  validates :name, presence: true
  has_many :tasks
  has_many :shared_lists
  has_many :users, through: :shared_lists

  def user_ids=(user_ids)
    user_ids.each do |user_id|
      self.shared_lists.build(user: User.find(user_id), permission: :collaborator).save
    end
  end

  def owner
    self.shared_lists.find_by(permission: :owner).user
  end
end
