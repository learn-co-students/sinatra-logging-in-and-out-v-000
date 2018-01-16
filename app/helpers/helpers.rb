class Helpers
  def current_user(id)
    User.find_by(id: id)
  end
end
