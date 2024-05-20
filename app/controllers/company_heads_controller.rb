class CompanyHeadsController < ApplicationController
  before_action :set_company

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
end
