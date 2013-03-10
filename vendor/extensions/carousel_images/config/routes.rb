Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :carousel_images do
    resources :carousel_images, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :carousel_images, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :carousel_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
