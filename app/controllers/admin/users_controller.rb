module Admin
  class UsersController < DefaultController

    responders :flash
    respond_to :html
    respond_to :js

    include BaseController::Datatable

    set_datatable_class 'Admin::UserDatatable'


    def index
      run Admin::User::Index
    end


    def new
      run Admin::User::Create::Present
    end


    def create
      run Admin::User::Create do |result|
        return respond_with result['model'], location: -> { admin_users_path }
      end
      render :new
    end


    def edit
      run Admin::User::Update::Present
    end


    def update
      run Admin::User::Update do |result|
        reload_user_locales if result['model'].id == current_user.id
        return respond_with result['model'], location: -> { admin_users_path }
      end
      render :edit
    end


    def destroy
      run Admin::User::Delete
      respond_with result['model'], location: -> { admin_users_path }
    end


    def change_password
      run Admin::User::Password::Present
    end


    def update_password
      run Admin::User::Password do |result|
        sign_in(result['model'], bypass: true) if result['model'].id == current_user.id
        return respond_with result['model'], location: -> { admin_users_path }
      end
      render :change_password
    end

  end
end
