class Category < ApplicationRecord
  belongs_to :config
  belongs_to :user
end
