module ApplicationHelper
  include ActionView::Helpers::AssetTagHelper

  def page_title
    return @page_title.presence || 'Stimulating stoner conversation starters — WeedTalks'
  end

  def humanize_boolean(boolean)
    I18n.t((!!boolean).to_s)
  end
end
