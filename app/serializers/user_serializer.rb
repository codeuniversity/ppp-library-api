class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :nickname
end
