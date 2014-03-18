
# 3rd party gems / libs

require 'active_record'   ## todo: add sqlite3? etc.

require 'props'
require 'props/db'  # note: also use ConfDb (ConfDb::Model::Prop etc.)
require 'logutils'
require 'textutils'

#########
# fix/todo:
#   move props/db  - Props.create_from_fixture! to textutils/db
#    require 'textutils/db'

#######################
# fix/remove once removed from HashReaderV2

module WorldDb
  module Model
    Prop = ConfDb::Model::Prop
  end
  Models = Model
end



# our own code

require 'tagutils/version'  # let it always go first

require 'tagutils/tags'
require 'tagutils/categories'



####
# use shared/common module/namespace ?
#   e.g.
#   - ClassificationDb, ClassiDb ??
#   - TaxonomyDb, TaxonDb, TaxyDb ??? 
#   - TopicDb, KeywordDb ??  --  why? why not??

module TagUtils

  def self.banner
    "tagutils/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

end  # module TagUtils


puts TagUtils.banner    # say hello
