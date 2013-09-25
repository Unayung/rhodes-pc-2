class News < ActiveRecord::Base
  attr_accessible :title, :author, :content
  scope :this_month, where(:created_at => Date.today.beginning_of_month..Date.today.end_of_month)

  acts_as_url :title

  auto_html_for :content do
      youtube(:width => 400, :height => 250)
      link :target => "_blank", :rel => "nofollow"
      simple_format
    end

  def to_param
    url # or whatever you set :url_attribute to
  end

end
