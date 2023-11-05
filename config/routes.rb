Rails.application.routes.draw do
  devise_for :users
  
  root to:"monitorings#index"
  resources :monitorings do
    collection do
      get 'lists'
      get 'step2'
    end
    member do
      get 'edit_step2'      
    end
  end
end
