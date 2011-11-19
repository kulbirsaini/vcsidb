module ApplicationHelper
  def image_for(value)
    image_tag(value ? asset_path('icons/true.png') : asset_path('icons/false.png'))
  end

  def icon_for(action, title = '')
    image_tag(asset_path("icons/#{action}.png"), :title => title)
  end
end
