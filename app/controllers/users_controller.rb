class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:user][:company_id].present?
        company = Company.find_by(company_id: params[:user][:company_id])
        if company
          @user.update(company: company, approved: false)
          flash[:notice] = "Your Account Approval is Pending."
        else
          flash[:alert] = "Invalid Company ID."
          render :new and return
        end
      else
        @user.update(approved: true)
      end
      redirect_to root_path, notice: "Signed Up Successfully."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :role, :email, :password, :password_confirmation, :company_id)
  end
end
