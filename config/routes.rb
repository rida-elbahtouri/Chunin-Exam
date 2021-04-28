Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shortenurls, only:['create','new','index']

  get '/:url', to: 'shortenurls#goto', param: :slug
  get '/', to: 'shortenurls#index', as: :home
end
