module ApplicationHelper
  def logged_in?
    false
  end

  def current_user
    Struct.new(:name).new('ほげ')
  end
end
