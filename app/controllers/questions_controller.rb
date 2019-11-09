class QuestionsController < BaseController
  def index
    render :new
  end

  def new
  end

  def create
    question = Question.create(question_params)

    if question.save
      mixpanel.track('Question Added', {
        'Question Id': question.id,
        'Question Title': question.title
      })
      flash.now[:success] = "<strong>Thanks for that, eh!</strong> If we think your question should be in the game, we will add it!"
    else
      flash.now[:error] = question.errors.full_messages.to_sentence
    end

    render :new
  end

  private

  def question_params
    params.permit(:title)
  end
end
