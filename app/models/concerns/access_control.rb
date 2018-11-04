module AccessControl
  extend ActiveSupport::Concern

  def deletable_by?(current_user)
    user == current_user
  end
end
