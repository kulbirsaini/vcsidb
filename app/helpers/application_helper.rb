module ApplicationHelper
  def image_for(value)
    image_tag(value ? asset_path('icons/true.gif') : asset_path('icons/false.gif'))
  end

  def icon_for(action)
    case action
    when 'show'
      image_tag(asset_path('icons/full.gif'))
    when 'edit'
      image_tag(asset_path('icons/edit.gif'))
    when 'delete'
      image_tag(asset_path('icons/delete.gif'))
    end
  end
end
