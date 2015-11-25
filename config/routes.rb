Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions'}

  mount CASino::Engine => 'cas', :as => 'casino'

  root 'welcome#index'

end
