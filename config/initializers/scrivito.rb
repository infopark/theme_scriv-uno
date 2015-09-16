# Use Memcached as the 2nd level cache (https://rubygems.org/gems/dalli):
require 'active_support/cache/dalli_store'


Scrivito.configure do |config|
  #
  # Uncomment following lines in order to explicitly set the tenant and the API key.
  # If not explicitly set, the tenant and the API key are obtained from the environment variables
  # SCRIVITO_TENANT and SCRIVITO_API_KEY.
  #
  # config.tenant = 'my-tenant-123'
  # config.api_key = 'secret'
  #

  Scrivito.configure do |config|

    config.editing_auth do |env|
      request = ActionDispatch::Request.new(env)
      if request.session[:user].present?
        Scrivito::User.system_user
      end
    end

    config.second_level_cache = ActiveSupport::Cache::DalliStore.new(
      'server-downstairs.localnetwork:1234',
      'server-downstairs.localnetwork:4321',
      username: 'root', password: 'secret'
    )

  end


end
