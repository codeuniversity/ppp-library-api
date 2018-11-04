module Permission
  def unpermitted_delete(model)
    return false if model.deletable_by?(@current_user)

    render json: { error: "you are not allowed to delete this #{model.class.name.underscore.humanize.downcase}" },
      status: :forbidden
    true
  end

  def unpermitted_create(model)
    return if create_allowed?

    render json: { error: "you are not allowed to create this #{model.class.name.underscore.humanize.downcase}" },
      status: :forbidden

  end

  #needs to be explicitly overriden
  def create_allowed?
    true
  end
end
