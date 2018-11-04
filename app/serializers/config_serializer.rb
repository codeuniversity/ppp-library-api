class ConfigSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :script, :vote_count, :has_voted
  belongs_to :user
  has_many :categories

  def vote_count
    object[:vote_count] || object.votes.count
  end

  def has_voted
    scope&.votes&.where(config_id: object.id)&.any? || false
  end
end
