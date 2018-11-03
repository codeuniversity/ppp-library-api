class ConfigTag < ApplicationRecord
  belongs_to :config
  belongs_to :category
end
