class Question < ApplicationRecord
  has_many :answers
  belongs_to :user
  belongs_to :topic
end
