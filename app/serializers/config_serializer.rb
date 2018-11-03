class ConfigSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :script
  has_one :user
end
