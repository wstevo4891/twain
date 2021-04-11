class Blog < ApplicationRecord
  has_many :articles

  mount_uploader :cover, PortfolioUploader

  def self.find_with_article_and_comments(blog_id, article_id)
    includes(articles: [:comments])
      .where(articles: { id: article_id })
      .find(blog_id)
  end
end
