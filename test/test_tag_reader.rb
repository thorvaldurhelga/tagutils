# encoding: utf-8

require 'helper'

class TestTagReader < MiniTest::Unit::TestCase

  def setup
    TagDb.delete!
    CategoryDb.delete!

    Movie.delete_all
  end

  def test_read
    include_path = "#{TagUtils.root}/test"
    puts "[TestTagReader.test_read] include_path: #{include_path}"
    
    reader = TagDb::TagReader.new( include_path )
    reader.read( 'tags.1' )
  end


end # class TestTagReader
