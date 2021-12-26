require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "tag testing" do
    rec = Recipe.new({:title=>'title', :body=>'body', :all_tags=>'one, two, three'})
    assert_equal rec.tags.map{|t| t.name}.sort, ['one', 'two', 'three'].sort

    rec = Recipe.new({:title=>'title', :body=>'body', :all_tags=>'   one  '})
    assert_equal rec.tags.map{|t| t.name}, ['one']

    rec = Recipe.new({:title=>'title', :body=>'body', :all_tags=>''})
    assert_equal rec.tags.map{|t| t.name}, []

    rec = Recipe.new({:title=>'title', :body=>'body', :all_tags=>',,,'})
    assert_equal rec.tags.map{|t| t.name}, []

    rec = Recipe.new({:title=>'title', :body=>'body', :all_tags=>'whos there,,,'})
    assert_equal rec.tags.map{|t| t.name}, ['whos there']
  end

  test "empty fields" do
    rec = Recipe.new()
    assert_not rec.save()

    rec = Recipe.new({:title=>'title'})
    assert_not rec.save()

    rec = Recipe.new({:body=>'body'})
    assert_not rec.save()
  end
end
