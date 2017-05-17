class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id, :status, :due_date
end
