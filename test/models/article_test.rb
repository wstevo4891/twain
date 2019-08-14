require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def teardown
    puts ''
  end

  test 'can find by blog' do
    puts __method__
    articles = Article.blog('The Rails 4 Blues')
    puts articles.pluck(:blog)

    list = articles.select { |a| a.blog == 'The Rails 4 Blues' }

    assert_equal list.length, articles.length
  end
end
