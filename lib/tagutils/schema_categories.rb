# encoding: utf-8

module CategoryDb

class CreateDb < ActiveRecord::Migration

  def up

create_table :categories do |t|
  t.string  :key,   null: false
  t.string  :slug,  null: false
  t.string  :name,  null: false

  ## todo: add parent or similar for hierachy 
  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end

add_index :categories, :key, unique: true

create_table :categorizations do |t|
  t.references :category,      null: false
  t.references :categorizable, null: false, polymorphic: true

  # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
  t.timestamps
end

add_index :categorizations, :category_id
add_index :categorizations, [:categorizable_id, :categorizable_type]
add_index :categorizations, [:categorizable_id, :categorizable_type, :category_id], unique: true

  end # method up


  def down
    raise ActiveRecord::IrreversibleMigration
  end

end  # class CreateDb

end # module CategorDb
