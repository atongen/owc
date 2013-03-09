Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :waiting_families do
    resources :waiting_families, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :waiting_families, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :waiting_families, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
