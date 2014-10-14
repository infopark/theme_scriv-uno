module EditModeDetection
  def self.editing_allowed(session, value)
    session[:editing_allowed] = value
  end

  def self.editing_allowed?(env)
    if env['rack.session'][:editing_allowed]
      Scrivito::User.define(:kickstarter_user) do |user|
        # Use the user object to define the permissions of a user. See
        # Scrivito::UserDefinition for details
      end
    end
  end
end
