class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    company = Company.find_by(company_id: params[:user][:company_id])
    if Company
      @user = company.users.build(user_params.merge(role: 'Member', approved: false))

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully signed up. Awaiting approval"
      else
        render :new
      end
    else
      @user = User.new
      @user.errors.add(:company_id, "is invalid")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :company_id)
  end
end
