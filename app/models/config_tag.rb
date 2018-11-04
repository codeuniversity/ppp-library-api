class ConfigTag < ApplicationRecord
  include AccessControl

  belongs_to :config
  belongs_to :category

  validates :category, uniqueness: { scope: [:config_id, :category_id] }

  def user
    config.user
  end
end
