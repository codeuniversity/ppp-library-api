class Config < ApplicationRecord
  include AccessControl

  belongs_to :user
  has_many :config_tags
  has_many :categories, through: :config_tags
  has_many :votes

  validates :title, presence: true
  validates :script, presence: true
end
