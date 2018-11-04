class Vote < ApplicationRecord
  include AccessControl

  belongs_to :user
  belongs_to :config
end
