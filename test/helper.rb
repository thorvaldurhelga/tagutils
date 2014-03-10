
## $:.unshift(File.dirname(__FILE__))

## minitest setup

# require 'minitest/unit'
require 'minitest/autorun'

# include MiniTest::Unit  # lets us use TestCase instead of MiniTest::Unit::TestCase


# ruby stdlibs

require 'json'
require 'uri'
require 'pp'
require 'logger'

# ruby gems

require 'active_record'


# our own code

require 'tagutils'
require 'logutils/db'   # NB: explict require required for LogDb (not automatic) 



Tag            = TagDb::Model::Tag
Tagging        = TagDb::Model::Tagging

Category       = CategoryDb::Model::Category
Categorization = CategoryDb::Model::Categorization


class Movie < ActiveRecord::Base
  has_many_tags
  has_many_categories
end


class CreateMovieDb < ActiveRecord::Migration

  def up
    create_table :movies do |t|
      t.string  :key,   null: false
      t.string  :name,  null: false
      t.timestamps
    end
  end # method up

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end  # class CreateMovieDb



def setup_in_memory_db
  # Database Setup & Config

  db_config = {
    adapter:  'sqlite3',
    database: ':memory:'
  }

  pp db_config

  ActiveRecord::Base.logger = Logger.new( STDOUT )
  ## ActiveRecord::Base.colorize_logging = false  - no longer exists - check new api/config setting?

  ## NB: every connect will create a new empty in memory db
  ActiveRecord::Base.establish_connection( db_config )


  ## build schema

  LogDb.create
  ConfDb.create

  TagDb.create
  CategoryDb.create
  CreateMovieDb.new.up
end


setup_in_memory_db()
