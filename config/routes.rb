Rails.application.routes.draw do
  devise_for :authors

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "readers/home#index"
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  get '/blog' => "readers/home#index"
  get '/resume' => redirect('/blog/resume')
  scope module: 'authors' do
    get 'stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
  get '/resume' => '/blog/resume'
end