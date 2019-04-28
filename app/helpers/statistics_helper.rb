module StatisticsHelper
  def count_games
    Game.count
  end

  def count_questions
    Question.active.count
  end

  def count_questions_answered
    GameHistory.count
  end
end
