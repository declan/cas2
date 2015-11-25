Rails.application.routes.draw do
  devise_for :users
  mount CASino::Engine => 'cas', :as => 'casino'
  root 'welcome#index'
end
