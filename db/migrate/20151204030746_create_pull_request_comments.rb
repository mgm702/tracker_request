class CreatePullRequestComments < ActiveRecord::Migration
  def change
    create_table :pull_request_comments do |t|
      t.integer :pr_comment_github_id
      t.text :content_text
      t.belongs_to :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
