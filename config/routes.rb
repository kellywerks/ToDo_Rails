ToDo::Application.routes.draw do
  match ('tasks', {:via => :get, :to => 'tasks#index'})
end
