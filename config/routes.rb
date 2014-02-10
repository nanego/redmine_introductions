Rails.application.routes.draw do

  resources :introductions, except: [:show] do
    post 'introductions/do_not_show_again' => 'introductions#do_not_show_again', on: :member
    post 'introductions/update_last_view_date' => 'introductions#update_last_view_date', on: :member
    post 'introductions/show_again' => 'introductions#show_again', on: :member
  end

end