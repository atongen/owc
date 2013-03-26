Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :staffs, :path => 'staff' do
    resources :staffs, :path => '', :only => [:index] do
      collection do
        get :board
      end
    end
  end

  # Admin routes
  namespace :staffs, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :staffs do
        collection do
          post :update_positions
        end
      end
    end
  end

end
