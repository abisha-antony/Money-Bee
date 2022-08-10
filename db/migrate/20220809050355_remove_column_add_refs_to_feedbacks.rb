class RemoveColumnAddRefsToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedbacks, :email, :string
    add_reference :feedbacks, :users, foreign_key: true
  end
end
