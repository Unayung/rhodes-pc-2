module NewsHelper

  def render_news_title(news)
    news.title
  end

  def render_news_content(news)
    news.content_html
  end

  def render_news_author(news)
    news.author
  end
end
