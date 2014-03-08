# encoding: utf-8

module TagDb
  module Model


class Tag < ActiveRecord::Base

  ###########################################################################3
  # alias for name (remove! add depreciated api call) ?? why? why not??
  def title()       name;              end
  def title=(value) self.name = value; end

end   # class Tag


class Tagging < ActiveRecord::Base
  # add code here
end   # class Tagging



  end # module Model

  ##### add convenience module alias in plural e.g. lets you use include TagDb::Models
  Models = Model

end # module TagDb
