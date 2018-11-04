class Category < ApplicationRecord
  include AccessControl

  has_many :config_tags
  has_many :configs, through: :config_tags
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
