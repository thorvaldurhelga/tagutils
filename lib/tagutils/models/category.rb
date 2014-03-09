# encoding: utf-8

module CategoryDb
  module Model

class Category < ActiveRecord::Base

  self.table_name = 'categories'

  has_many :categorizations

  ###
  ## todo/fix: add validate for key - what constraints to use ??
  #
  ## nb: only allow spaces and underscore inbetween;
  ##  do NOT allow digit as first char for now
  # validates :key,  :format => { :with    => /^([a-z]|[a-z][a-z0-9_ ]*[a-z0-9])$/,
  #                              :message => 'expected one or more lowercase letters a-z or 0-9 digits or space or underscore' }

  scope :by_key,  -> { order( 'key desc' ) }
  scope :by_name, -> { order( 'name desc' ) }

  before_save :on_before_save

  def on_before_save
    # replace space with dash e.g. north america becomes north-america and so on
    self.slug = key.gsub( ' ', '-' )
  end


  ############################################################################
  # alias for name (remove! add depreciated api call) ?? why? why not??

  def title()       name;              end
  def title=(value) self.name = value; end
  
  scope :by_title, -> { order( 'name desc' ) }  ### depreciated ??? - use by_name


end   # class Category


  end # module CategoryDb
end # module Model
