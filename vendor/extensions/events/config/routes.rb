Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index] do
      collection do
        get :upcoming
        get :past
      end
    end
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :events, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
