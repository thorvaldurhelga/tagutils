# encoding: utf-8

require 'helper'

class TestModels < MiniTest::Unit::TestCase

  def setup
    TagDb.delete!
    CategoryDb.delete!

    Movie.delete_all
  end

  def test_count
    assert_equal 0, Tag.count
    assert_equal 0, Tagging.count

    assert_equal 0, Category.count
    assert_equal 0, Categorization.count

    assert_equal 0, Movie.count
  end

  def test_assocs
    tag = Tag.new( key: 'key', name: 'name' )
    assert_equal 0, tag.taggings.count

    cat = Category.new( key: 'key', name: 'name' )
    assert_equal 0, cat.categorizations.count

    movie = Movie.new( key: 'key', name: 'name' )
    assert_equal 0, movie.taggings.count
    assert_equal 0, movie.tags.count
    
    assert_equal 0, movie.categorizations.count
    assert_equal 0, movie.categories.count

    tag.save!
    cat.save!
    movie.save!

    assert_equal 0, tag.taggings.count
    assert_equal 0, cat.categorizations.count

    assert_equal 0, movie.taggings.count
    assert_equal 0, movie.tags.count
    assert_equal 0, movie.categorizations.count
    assert_equal 0, movie.categories.count

    ## note: add tag; op << will auto-save
    movie.tags << tag

    assert_equal 1, tag.taggings.count
    assert_equal 1, movie.taggings.count
    assert_equal 1, movie.tags.count

    ## note: add tag; op << will auto-save
    movie.categories << cat

    assert_equal 1, cat.categorizations.count
    assert_equal 1, movie.categorizations.count
    assert_equal 1, movie.categories.count
  end

end # class TestModels
