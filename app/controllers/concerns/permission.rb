module Permission
  def unpermitted_delete(model)
    return false if model.deletable_by?(@current_user)

    render json: { error: "you are not allowed to delete this #{model.class.name.underscore.humanize.downcase}" },
      status: :forbidden
    true
  end
end
