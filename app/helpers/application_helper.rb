module ApplicationHelper
  def page_title(title)
    if title.empty?
      "Welcome to FIXLET"
    else
      "#{title} | Welcome to FIXLET"
    end
  end
end
