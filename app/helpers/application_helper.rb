module ApplicationHelper
  def is_active?(cont, page)
    'active' if params[:action] == page && params[:controller] == cont
  end
end
