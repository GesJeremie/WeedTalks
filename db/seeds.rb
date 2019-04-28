# We reserve the db:seed tasks specifically for data that must be present for your application to function in any environment.
# One example of this may be a list of US States in your database that your address form relies on.
# That data should always exist, whether the app is being used in development or production.

class Seed
  def perform
    questions.map do |question|
      create_question(question)
    end
  end

  private

  def questions
    [
      'How high are you on a scale of yes to yes?',
      'If you could be a color, what color woud it be? and why?',
      'What are you craving right now?',
      'Dogs or Cats?',
      'If you could spend one day with one celebrity in the world, who would it be?',
      'If you could travel back in the past, what year would it be?',
      'You\'ve been granted one wish, what do you ask?'
    ]
  end

  def create_question(title)
    puts "Adding question `#{title}` if doesn't exist."

    Question.find_or_create_by(
      title: title,
      active: true
    )
  end
end


Seed.new.perform
