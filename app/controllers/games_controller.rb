class GamesController < BaseController
  def new
    session.delete(:game_id)
    redirect_to action: 'show'
  end

  def show
    @question = Games::Manager.new(current_game).pull_question
  end
end
