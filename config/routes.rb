Rails.application.routes.draw do
  root "task_lists#index"
  get "about" => "main#about"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "/add_task" => "task_lists#add_task_get"
  post "/add_task" => "task_lists#add_task_post"
  get "/edit/:id" => "task_lists#edit_get"
  put "/edit/:id" => "task_lists#edit_put"
  get "/task/new/:id" => "task#new"
  post "/task/new/:id" => "task#create"
  delete "/task/delete/:id" => "task#delete"
  get "/task_list/:id" => "task_lists#show"
  patch "/complete_task/:id" => "task#complete"
  get "complete/:id/task" => "task#complete_task"
  delete "/delete_task/:id" => "task_lists#delete"
end
