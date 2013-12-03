class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  def landing
    if params[:month].present?
      @month = params[:month]
      if @month.to_i == 12
        @next_month = 1
        @previous_month = 11
      elsif @month.to_i == 1
        @previous_month = 12
        @next_month = 2
      else
        @next_month  = @month.to_i + 1
        @previous_month = @month.to_i - 1
      end
    else
      @month = DateTime.now.month
      @next_month = (DateTime.now + 1.month).month
      @previous_month = (DateTime.now - 1.month).month
    end
    @people = Person.all
    # @news = News.is_previous(@month).is_published
    @news = News.latest_ten
    @events = Event.latest_ten
    @year = Date.today.year
    @display_date = "#{Date.today.strftime("%B")} #{Date.today.strftime("%Y")}"
    # @display_month = "#{@year}-#{@month}-1".to_date.strftime("%B")

    # @news_has_next = News.is_previous(@next_month).is_published.any?
    # @news_has_previous = News.is_previous(@previous_month).is_published.any?

    # @events_has_next = Event.is_previous(@next_month).is_published.any?
    # @events_has_previous = Event.is_previous(@previous_month).is_published.any?
  end

  protected

  def layout_for_page
    case params[:id]
    when 'glenn', 'heather'
      'bio'
    else
      'application'
    end
  end

end