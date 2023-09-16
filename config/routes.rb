Rails.application.routes.draw do
  devise_for :users # Si estás utilizando Devise para la autenticación de usuarios

  resources :flats do
    # Rutas estándar RESTful
    collection do
      get :new, action: :new, as: :new
      post :create, action: :create, as: :create
    end
    member do
      get :show, action: :show, as: :show
      get :edit, action: :edit, as: :edit
      patch :update, action: :update, as: :update
      delete :destroy, action: :destroy, as: :destroy
    end
  end

  root 'flats#index' # Ruta raíz, puedes cambiarla según tus necesidades
end
