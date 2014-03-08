# encoding: utf-8

require 'helper'

class TestModels < MiniTest::Unit::TestCase

  def setup
    TagDb.delete!
  end

  def test_count
    assert_equal 0, Tag.count
    assert_equal 0, Tagging.count
    assert_equal 0, Movie.count
  end

  def test_assocs
    tag = Tag.new( key: 'key', name: 'name' )
    assert_equal 0, tag.taggings.count

    movie = Movie.new( key: 'key', name: 'name' )
    assert_equal 0, movie.taggings.count
    assert_equal 0, movie.tags.count

    tag.save!
    movie.save!

    assert_equal 0, tag.taggings.count

    assert_equal 0, movie.taggings.count
    assert_equal 0, movie.tags.count

    ## note: add tag; op << will auto-save
    movie.tags << tag

    assert_equal 1, tag.taggings.count
    assert_equal 1, movie.taggings.count
    assert_equal 1, movie.tags.count
  end

end # class TestModels
