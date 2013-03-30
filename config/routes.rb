CarrierwaveJQueryFileUpload::Application.routes.draw do

  root :to => 'galleries#index'

  resources :galleries, :only => [:new, :create, :edit, :update, :destroy] do
    resources :images, :only => [:index, :create, :destroy]
    get 'manage', :on => :member
  end

end
