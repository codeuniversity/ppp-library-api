class ConfigTag < ApplicationRecord
  include AccessControl

  belongs_to :config
  belongs_to :category

  def user
    config.user
  end
end
