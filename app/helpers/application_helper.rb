module ApplicationHelper
  # Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    base_title if @title.nil?
    "#{base_title} | #{@title}"
  end
end
