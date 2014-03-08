# encoding: utf-8

module TagDb

class CreateDb < ActiveRecord::Migration

  def up

create_table :tags do |t|
  t.string  :key,   null: false
  t.string  :slug,  null: false
  t.string  :name    # todo: make required?  -- note: was title formerly
  t.integer :grade, null: false, default: 1  # grade/tier e.g. 1/2/3 for now
  ## todo: add parent or similar for hierachy (for tag stacks/packs)
  t.timestamps   # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
end

add_index :tags, :key,  unique: true

create_table :taggings do |t|
  t.references :tag,      null: false
  t.references :taggable, polymorphic: true
  t.timestamps   # todo: use only t.datetime :created_at (do we get ar magic? is updated used/needed??)
end

add_index :taggings, :tag_id
add_index :taggings, [:taggable_id, :taggable_type]

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end  # class CreateDb

end # module TagDb