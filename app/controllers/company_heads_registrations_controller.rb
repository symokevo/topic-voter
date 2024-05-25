class CompanyHeadsRegistrationsController < ApplicationController
  def new
    @company = Company.new
    @user = @company.users.build
  end

  def create
    @company = Company.new(company_params)
    @company.generate_company_id # Generate company_id before saving
    @user = @company.users.build(user_params.merge(role: 'Company Head', approved: true))

    if @company.save && @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed up as a company head."
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
