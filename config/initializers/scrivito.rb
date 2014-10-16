Scrivito.configure do |config|
  config.tenant = Rails.application.secrets.scrivito['tenant']
  config.api_key = Rails.application.secrets.scrivito['api_key']

  config.choose_homepage do |env|
    Homepage.default
  end

  # This callback is important for security.
  #
  # It is used to provide inplace editing features. Even if you don't use inplace editing
  # on the client side, the server side also uses this callback to determine if CMS data
  # can be modified in the database.
  config.editing_auth do |env|
    EditModeDetection.editing_allowed?(env)
    Scrivito::User.define('test_user') do |user|
      Scrivito::User::VERBS.each { |action| user.can_always action, :workspace }
    end
  end
end
