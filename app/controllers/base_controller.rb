class BaseController < ApplicationController
  layout :current_layout

  def current_layout
    request.xhr? ? false : 'application'
  end
end
