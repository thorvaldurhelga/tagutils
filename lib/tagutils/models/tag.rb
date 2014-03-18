# encoding: utf-8

module TagDb
  module Model

class Tag < ActiveRecord::Base

    has_many :taggings

    ## nb: only allow spaces and underscore inbetween;
    ##  do NOT allow digit as first char for now
    validates :key,  :format => { :with    => /^([a-z]|[a-z][a-z0-9_ ]*[a-z0-9])$/,
                                  :message => 'expected one or more lowercase letters a-z or 0-9 digits or space or underscore' }

    scope :by_key,   -> { order( 'key desc' )  }
    scope :by_name,  -> { order( 'name desc' ) }
    scope :top,      -> { where( 'grade=1' )   }


    before_save :on_before_save

    def on_before_save
      # replace space with dash e.g. north america becomes north_america and so on
      self.slug = key.gsub( ' ', '_' )

      ## if name is empty auto fill w/ key
      self.name = key   if name.blank?
    end

end   # class Tag

  end # module TagDb
end # module Model
