class CompanyHeadsRegistrationsController < Devise::RegistrationsController
  def new
    @company = Company.new
    @user = @company.users.build
  end

  def create
    @company = Company.new(company_params)
    @user = @company.users.build(user_params.merge(role: 'Company Head', approved: true))

    ActiveRecord::Base.transaction do
      if @company.save
        if @user.save
          sign_in(@user) # Sign in the user after saving
          redirect_to root_path, notice: "Successfully signed up as a company head."
        else
          raise ActiveRecord::Rollback
        end
      else
        raise ActiveRecord::Rollback
      end
    end

    if @company.errors.any? || @user.errors.any?
      flash.now[:alert] = @company.errors.full_messages + @user.errors.full_messages
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, user_attributes: [:full_name, :email, :password, :password_confirmation])
  end

  def user_params
    params.require(:company).require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
