class GameHistory < ApplicationRecord
  belongs_to :game
  belongs_to :question

  validates :game, presence: true
  validates :question, presence: true

  validates_uniqueness_of :game, scope: :question
end
