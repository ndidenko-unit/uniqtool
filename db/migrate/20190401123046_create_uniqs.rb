class CreateUniqs < ActiveRecord::Migration[5.2]
  def change
    create_table :uniqs do |t|
      t.text :request, limit: 500000
      t.text :result, limit: 500000
      t.integer :before_count, default: 0
      t.integer :after_count, default: 0
      t.timestamps
    end
  end
end
