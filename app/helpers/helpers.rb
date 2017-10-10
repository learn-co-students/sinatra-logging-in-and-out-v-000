class Helpers
  def self.current_user(params)
    # params.find { |k, v | }
  end

  def self.is_logged_in?(params)
    params.has_key?("id")
  end

end
