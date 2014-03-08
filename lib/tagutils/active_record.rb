

module ActiveRecord
  class Base

    def self.has_many_tags( opts={} )
      has_many :taggings, class_name: 'TagDb::Model::Tagging', :as      => :taggable
      has_many :tags,     class_name: 'TagDb::Model::Tag',     :through => :taggings
    end

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

