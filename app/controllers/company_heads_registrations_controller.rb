class CompanyHeadsRegistrationsController < ApplicationController
  def new
    @company = Company.new
    @user = @company.users.build
  end

  def create
    @company = Company.new(company_params)
    @user = @company.users.build(user_params)
    if @company.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed up."
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def user_params
    params.require(:user).permit(:full_name, :role, :email, :password, :password_confirmation)
  end
end
