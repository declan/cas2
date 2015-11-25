Rails.application.routes.draw do
  mount CASino::Engine => '/', :as => 'casino'
  get '/welcome' => 'welcome#index'
end
