Rails.application.routes.draw do

  get '/cas/login' => 'cas_interceptor#new'

  devise_for :users, controllers: {sessions: 'sessions'}

  mount CASino::Engine => 'cas', :as => 'casino'

  root 'welcome#index'

end
