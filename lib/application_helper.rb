module ApplicationHelper

  # Browser title
  def title(site_title)
    page_title = current_page.data.page_title || current_page.data.title
    [page_title, site_title].reject(&:blank?).join(' | ')
  end

  # Display IcoMoon font icon
  def icon key
    "<i data-icon=&#x#{h(key)}></i>"
  end

end
