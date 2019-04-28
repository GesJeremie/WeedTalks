module Games
  class Manager
    attr_reader :game

    def initialize(game)
      @game = game
    end

    def pull_question
      questions_not_answered.sample.tap do |question|
        add_to_game_history(question)
      end
    end

    def finished?
      questions_not_answered.any?
    end

    private

    def add_to_game_history(question)
      return unless question.present?

      GameHistory.create(
        question_id: question.id,
        game_id: game.id
      )
    end

    def questions_not_answered
      Question.active.where.not(id: questions_answered.pluck(:question_id))
    end

    def questions_answered
      GameHistory.where(game_id: game.id)
    end
  end
end
