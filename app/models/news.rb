# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  author       :string(255)
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  url          :string(255)
#  content_html :text
#

class News < ActiveRecord::Base
  attr_accessible :title, :author, :content, :will_publish_at
  validates_presence_of :title, :content
  scope :is_published, where("will_publish_at <= ?", Date.today)
  acts_as_url :title

  auto_html_for :content do
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def self.latest_ten
    last(10).reverse
  end

  def to_param
    url # or whatever you set :url_attribute to
  end

  def self.is_previous(month)
    month_begin = "#{Date.today.year}-#{month}-1".to_date
    month_end = month_begin.end_of_month
    where(:will_publish_at => month_begin..month_end)
  end
end
