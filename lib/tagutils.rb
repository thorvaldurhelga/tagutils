
# 3rd party gems / libs

require 'active_record'   ## todo: add sqlite3? etc.

require 'props'
require 'props/db'  # note: also use ConfDb (ConfDb::Model::Prop etc.)
require 'logutils'
require 'textutils'


# our own code

require 'tagutils/version'  # let it always go first

require 'tagutils/schema_tags'
require 'tagutils/models/tag'
require 'tagutils/models/tagging'

require 'tagutils/schema_categories'
require 'tagutils/models/category'
require 'tagutils/models/categorization'

module TagDb
  VERSION = TagUtils::VERSION
  #####
  # add convenience module alias in plural
  #   e.g. lets you use include TagDb::Models
  Models = Model
end

module CategoryDb
  VERSION = TagUtils::VERSION
  #####
  # add convenience module alias in plural
  #   e.g. lets you use include TagDb::Models
  Models = Model
end


require 'tagutils/active_record'   # -- adds has_many_tags, has_many_categories class macros

require 'tagutils/readers/tag'



module TagUtils

  def self.banner
    "tagutils/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

end  # module TagUtils



module TagDb

  def self.create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.tag.version', value: VERSION )
  end

  # delete ALL records (use with care!)
  def self.delete!
    puts '*** deleting tag/tagging table records/data...'
    Model::Tagging.delete_all
    Model::Tag.delete_all
  end

  def self.tables
    puts "#{Model::Tag.count} tags"
    puts "#{Model::Tagging.count} taggings"
  end

end # module TagDb


module CategoryDb

  def self.create
    CreateDb.new.up
    ConfDb::Model::Prop.create!( key: 'db.schema.category.version', value: VERSION )
  end

  # delete ALL records (use with care!)
  def self.delete!
    puts '*** deleting category/categorization table records/data...'
    Model::Categorization.delete_all
    Model::Category.delete_all
  end

  def self.tables
    puts "#{Model::Category.count} categories"
    puts "#{Model::Categorization.count} categorizations"
  end
end # module CategoryDb

CatDb = CategoryDb  # for conveniene add alias for CatDb


####
# use shared/common module/namespace ?
#   e.g.
#   - ClassificationDb, ClassiDb ??
#   - TaxonomyDb, TaxonDb, TaxyDb ??? 
#   - TopicDb, KeywordDb ??  --  why? why not??


puts TagUtils.banner    # say hello
