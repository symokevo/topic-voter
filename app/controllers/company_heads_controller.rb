class CompanyHeadsController < ApplicationController
  before_action :set_company

  def new
    @user = @company.users.build
  end

  def create
    @user = @company.users.build(user_params)
    company = Company.new(name: params[:user][:company_name])
    if company.save
      @user.company = company
      @user.role = params[:user][:role]
      @user.approved = true

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Successfully signed up as a company head."
      else
        render :new
      end
    else
      @user.errors.add(:company_name, "is invalid")
      render :new
    end
  end

  def index
    @users = @company.users.where(approved: false)
  end

  def approve
    user = @company.users.find(params[:id])
    user.update(approved: true)
    redirect_to company_heads_path, notice: "User Approved."
  end

  def destroy
    user = @company.users.find(params[:id])
    user.destroy
    redirect_to company_heads_path, notice: "User Deleted."
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def user_params
    params.require(:user).permit(:full_name, :role, :email, :password, :password_confirmation)
  end
end
