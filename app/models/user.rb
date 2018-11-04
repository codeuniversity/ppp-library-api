# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :trackable, :omniauthable,:rememberable

  include DeviseTokenAuth::Concerns::User

  has_many :configs
  has_many :categories
  has_many :votes
end
