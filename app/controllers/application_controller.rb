class ApplicationController < ActionController::Base
     def create
          @task = Task.new(task_params)
      
          respond_to do |format|
            if @task.save
              format.html { redirect_to @task, notice: 'Task was successfully created.' }
              format.json { render :show, status: :created, location: @task }
            else
              format.html { render :new }
              format.json { render json: @task.errors, status: :unprocessable_entity }
            end
          end
        end
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
         end
     #     def after_sign_in_path_for(resource)
     #      edit_user_registration_path
     #    end
end
