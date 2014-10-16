module EditModeDetection
  def self.editing_allowed(session, value)
    session[:editing_allowed] = value
  end

  def self.editing_allowed?(env)
    if env['rack.session'][:editing_allowed]
    end
  end
end
