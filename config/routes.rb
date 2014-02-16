Rails.application.routes.draw do

  resources :introductions, except: [:show] do
    post 'do_not_show_again'
    post 'update_last_view_date'
    post 'show_again'
  end

end