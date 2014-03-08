
# 3rd party gems / libs

require 'active_record'   ## todo: add sqlite3? etc.
require 'logutils'


# our own code

require 'tagutils/version'  # let it always go first

require 'tagutils/schema'
require 'tagutils/models'


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
    ## WorldDb::Model::Prop.create!( key: 'db.schema.world.version', value: VERSION )
  end

  # delete ALL records (use with care!)
  def self.delete!
    ## fix: use Deleter (see sportdb etc.)
    puts '*** deleting tag/tagging table records/data...'
    Model::Tagging.delete_all
    Model::Tag.delete_all
  end # method delete!

  def self.tables
    ## fix: use Stats class (see sportdb etc.)
    puts "#{Model::Tag.count} tags"
    puts "#{Model::Tagging.count} taggings"
  end

end # module TagDb



puts TagUtils.banner    # say hello

