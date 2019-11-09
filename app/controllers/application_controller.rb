class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate, if: :admin_controller?

  def current_game
    @current_game ||= begin
      if session[:game_id]
        Game.find(session[:game_id])
      else
        Game.create.tap do |game|
          session[:game_id] = game.id
        end
      end
    end
  end
  helper_method :current_game

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |user, password|
      basic_auth = Weedtalks.config.basic_auth
      (user == basic_auth[:user]) && (password == basic_auth[:password])
    end
  end

  def view_model_options
    params.to_unsafe_h.merge(
      current_game: current_game
    )
  end

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end
end
