Rails.application.routes.draw do
   root 'ideas#index'
   resource :ideas
end
