class NewslettersController < BaseController
  def create
    model = Newsletter.new(newsletter_params)

    if model.save
      session[:enrolled_newsletter] = true
      mixpanel.track('Newsletter Enrolled', {
        'Email': model.email
      })
      flash[:success] = '<strong>Whoop, Whoop!</strong> - We will let you know!'
    else
      flash[:error] = '<strong>Oh No!</strong> - You are already enrolled!'
    end

    redirect_back fallback_location: root_path
  end

  private

  def newsletter_params
    params.permit(:email)
  end
end
