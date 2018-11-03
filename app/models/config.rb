class Config < ApplicationRecord
  belongs_to :user
  has_many :config_tags
  has_many :categories, through: :config_tags
  has_many :votes
end
