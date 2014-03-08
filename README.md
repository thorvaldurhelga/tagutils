# tagutils

tagutils gems - tag utilities (tag, taggings, tag list, etc.)

* home  :: [github.com/rubylibs/tagutils](https://github.com/rubylibs/tagutils)
* bugs  :: [github.com/rubylibs/tagutils/issues](https://github.com/rubylibs/tagutils/issues)
* gem   :: [rubygems.org/gems/tagutils](https://rubygems.org/gems/tagutils)
* rdoc  :: [rubydoc.info/gems/tagutils](http://rubydoc.info/gems/tagutils)

## Usage

TBD


## Real World Usage

- [worlddb gem](http://rubygems.org/gems/worlddb) - continent, country, region, metro, city, district etc. models
- [winedb gem](http://rubygems.org/gems/winedb) - wine, winery, winemaker, vineyards, etc. models 
- [beerdb gem](http://rubygems.org/gems/beerdb) - beer, brand, brewery, etc. models


## Alternatives

- [acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on)

~~~
create_table :tags do |t|
  t.string  :name
end

create_table :taggings do |t|
  t.references :tag
  t.references :taggable, :polymorphic => true
  t.references :tagger,   :polymorphic => true
  t.string     :context,  :limit => 128
  t.datetime   :created_at
end
~~~

(Source: [db/migrate/1_acts_as_taggable_on_migration.rb](https://github.com/mbleigh/acts-as-taggable-on/blob/master/db/migrate/1_acts_as_taggable_on_migration.rb))


- [is_taggable](https://github.com/jamesgolick/is_taggable)

~~~
create_table :tags do |t|
  t.string :name, :default => ''
  t.string :kind, :default => ''
end

create_table :taggings do |t|
  t.integer :tag_id

  t.string  :taggable_type, :default => ''
  t.integer :taggable_id
end
~~~

(Source: [generators/is_taggable_migration/templates/migration.rb](https://github.com/jamesgolick/is_taggable/blob/master/generators/is_taggable_migration/templates/migration.rb))

- [rocket_tag](https://github.com/bradphelan/rocket_tag)

~~~
create_table :tags do |t|
  t.string :name
end

create_table :taggings do |t|
  t.references :tag
  t.references :taggable, :polymorphic => true
  t.references :tagger,   :polymorphic => true
  t.string     :context
  t.datetime   :created_at
end

create_table :alias_tags, :id => false do |t|
  t.integer :tag_id
  t.integer :alias_id
end
~~~

(Source: [generators/rocket_tag/migration/templates/active_record/migration.rb](https://github.com/bradphelan/rocket_tag/blob/master/lib/generators/rocket_tag/migration/templates/active_record/migration.rb))


- [acts_as_taggable_redux](https://github.com/geemus/acts_as_taggable_redux)

~~~
create_table :tags do |t|
  t.column :name,           :string
  t.column :taggings_count, :integer, :default => 0, :null => false
end
 
create_table :taggings do |t|
  t.column :tag_id, :integer
  t.column :taggable_id, :integer
  t.column :taggable_type, :string
  t.column :user_id, :integer
end 
~~~

(Source: [generators/acts_as_taggable_tables/templates/migration.rb](https://github.com/geemus/acts_as_taggable_redux/blob/master/generators/acts_as_taggable_tables/templates/migration.rb))


- [acts_as_taggable_on_steroids](https://github.com/mattetti/acts_as_taggable_on_steroids)

~~~
create_table :tags do |t|
  t.column :name, :string
end
    
create_table :taggings do |t|
  t.column :tag_id,        :integer
  t.column :taggable_id,   :integer
  t.column :taggable_type, :string
      
  t.column :created_at,    :datetime
end
~~~

(Source: [generators/acts_as_taggable_migration/templates/migration.rb](https://github.com/mattetti/acts_as_taggable_on_steroids/blob/master/generators/acts_as_taggable_migration/templates/migration.rb))


- [Ruby Toolbook - Rails Tagging Category](https://www.ruby-toolbox.com/categories/rails_tagging)



## License

The `tagutils` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
