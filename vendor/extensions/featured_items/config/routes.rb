Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :featured_items do
    resources :featured_items, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :featured_items, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :featured_items, :except => :show do
        collection do
          get 'model_items'
        end

        collection do
          post :update_positions
        end
      end
    end
  end

end
