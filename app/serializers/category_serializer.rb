class CategorySerializer < ActiveModel::Serializer
  attributes :id
  has_one :config
  has_one :user
end
