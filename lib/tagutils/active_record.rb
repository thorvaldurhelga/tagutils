
module TagDb
  module ClassMacros
    def has_many_tags( opts={} )
      puts "  [TagDb.has_many_tags] adding taggings n tags has_many assocs to model >#{name}<"
      has_many :taggings, class_name: 'TagDb::Model::Tagging', :as      => :taggable
      has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings
    end
  end
end

module CategoryDb
  module ClassMacros
    def has_many_categories( opts={} )
      puts "  [CategoryDb.has_many_categories] adding categorizations n category has_many assocs to model >#{name}<"
      has_many :categorizations, class_name: 'CategoryDb::Model::Categorization', :as      => :categorizable
      has_many :categories,      class_name: 'CategoryDb::Model::Category',       :through => :categorizations
    end
  end
end


module ActiveRecord
  class Base
    extend TagDb::ClassMacros
    extend CategoryDb::ClassMacros
  end # class Base
end # module ActiveRecord



####################################################
# todo/check:  use concern - why? why not? e.g
#

=begin
require 'active_support/concern'

module TagUtils::ActiveRecord
  extend ActiveSupport::Concern

  module ClassMethods
    def has_many_tags
      has_many :taggings, class_name: 'TagDb::Model::Tagging', :as => :taggable
      has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings
    end
  end
end

class ActiveRecord::Base
  include TagUtils::ActiveRecord
end

=end

