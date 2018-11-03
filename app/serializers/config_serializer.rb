class ConfigSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :script, :vote_count
  belongs_to :user
  has_many :categories

  def vote_count
    object.vote_count || object.votes.count
  end
end
