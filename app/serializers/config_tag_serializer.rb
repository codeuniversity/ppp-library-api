class ConfigTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :config
  has_one :category
end
