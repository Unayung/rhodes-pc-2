class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :event_file, :will_publish_at
  validates_presence_of :title, :event_file
  scope :is_published, where("will_publish_at <= ?", Date.today)
  acts_as_url :title
  mount_uploader :event_file, PdfUploader

  def to_param
    url # or whatever you set :url_attribute to
  end

  def self.is_previous(month)
    month_begin = "#{Date.today.year}-#{month}-1".to_date
    month_end = month_begin.end_of_month
    where(:will_publish_at => month_begin..month_end)
  end

  def file_name
    event_file.original_filename
  end
end
