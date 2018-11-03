class Category < ApplicationRecord
  has_many :config_tags
  has_many :configs, through: :config_tags
  belongs_to :user
end
