module AccessControl
  extend ActiveSupport::Concern

  def editable_by?(current_user)
    user == current_user
  end
end
