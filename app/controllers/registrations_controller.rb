class RegistrationsController < Devise::RegistrationsController
  #ssl_required :new, :create
  respond_to :html, :js, :json

  def resource_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :username, :current_password)
  end

  def create
    super
  end

  def destroy
    resource ||= User.find(params[:user_id])
    resource.destroy
    if params[:no_signout]
      redirect_to :root
    else
      set_flash_message :notice, :destroyed
      sign_out_and_redirect(self.resource)
    end
  end

  private :resource_params

end

