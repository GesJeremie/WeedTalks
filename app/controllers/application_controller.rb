class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD'], if: :admin_controller?

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

  def view_model_options
    params.to_unsafe_h.merge(
      current_game: current_game
    )
  end

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end
end
