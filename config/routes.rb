Rails.application.routes.draw do

  resources :introductions, except: [:show] do
    post 'introductions/do_not_show_again' => 'introductions#do_not_show_again', on: :member
  end

end