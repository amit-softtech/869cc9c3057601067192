class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_topics
  has_many :topics, through: :user_topics

  has_many :received_follows, foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers, through: :received_follows, source: "followings"

  has_many :questions
  has_many :answers

end
