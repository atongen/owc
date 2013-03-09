Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :waiting_kids do
    resources :waiting_kids, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :waiting_kids, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :waiting_kids, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
