class ConfigTagSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :config
  belongs_to :category
end
