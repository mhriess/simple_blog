class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  def self.ordered_by(param)
    case param
    when 'title'     then Article.order('title')
    when 'published' then Article.order('created_at DESC')
    when 'word_count' then Article.order('LENGTH(body)')
    else                  Article.all
    end
  end
end
