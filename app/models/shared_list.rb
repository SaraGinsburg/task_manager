class SharedList < ApplicationRecord
  belongs_to :list
  belongs_to :user

  enum permission: [:user, :collaborator, :owner]
end
