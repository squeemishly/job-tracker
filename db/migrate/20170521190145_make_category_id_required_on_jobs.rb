class MakeCategoryIdRequiredOnJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :category_id, :integer, null:false
  end
end
