class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  has_many :tasks
  belongs_to :shared_lists
end
