class Question < ApplicationRecord
  before_save :default_values
  has_many :game_history

  validates :title, presence: true, uniqueness: { message: 'already exists ...' }

  def self.active
    where(active: true)
  end

  private

  def default_values
    self.active = active.presence || false
  end
end
