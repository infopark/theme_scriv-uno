Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]

  scrivito_route '/', using: 'homepage', via: :all
  scrivito_route '(/)(*slug-):id', using: 'slug_id', via: :all

  # The following line can be deleted if the application never used the legacy ID-first routing
  get '/:id/:slug', to: redirect('/%{slug}-%{id}'), constraints: { id: /\h{16}/ }

  scrivito_route '/*permalink', using: 'permalink', format: false, via: :all
end
