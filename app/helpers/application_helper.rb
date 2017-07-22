module ApplicationHelper
  def active(path)
    return 'active' if request.path == path
    'active' if request.path == '/recipes' && path == '/'
  end
end
