class RenameCompanyIdToCompanyCode < ActiveRecord::Migration[7.1]
  def change
    rename_column :companies, :company_id, :company_code
  end
end
