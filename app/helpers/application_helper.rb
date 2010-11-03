module ApplicationHelper
  def logo_bt
    logo_bt = image_tag('battletech_logo.png', :alt => 'BatteTech', :class => 'round')
  end
  
  # Return a title on a per-page basis
  def title
    base_title = "MechYard"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
