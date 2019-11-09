class GamesController < BaseController
  def new
    session.delete(:game_id)
    redirect_to action: 'show'
  end

  def show
    @question = Games::Manager.new(current_game).pull_question

    if @question.present?
      mixpanel.track('Show Question', {
        'Question Id': @question.id,
        'Question Title': @question.title
      })
    else
      mixpanel.track('Game Finished', {
        'Game Id': current_game.id
      })
    end
  end
end
