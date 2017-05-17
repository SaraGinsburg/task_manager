class SharedListSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :user_id, :permission
end
