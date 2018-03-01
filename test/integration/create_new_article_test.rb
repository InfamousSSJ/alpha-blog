require 'test_helper'

class CreateNewArticeTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password")
  end
  
  test 'get new article form and create article' do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
     post_via_redirect articles_path, article: {title: "Test Article", description: "this is a test article"}
    end
    assert_template 'articles/show'
    assert_match 'Test Article', response.body
  end
end