class CompanyHeadsController < ApplicationController
  before_action :set_company, only: [:index, :approve, :destroy]

  def index
    @users = @company.users
  end

  def approve
    user = @company.users.find(params[:id])
    user.update(approved: true)
    redirect_to company_company_heads_path(@company), notice: "User Approved."
  end

  def destroy
    user = @company.users.find(params[:id])
    user.destroy
    redirect_to company_company_heads_path(@company), notice: "User Deleted."
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
end
