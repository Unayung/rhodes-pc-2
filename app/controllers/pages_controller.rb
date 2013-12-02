class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  def landing
    if params[:month].present?
      @month = params[:month]
    else
      @month = DateTime.now.month
    end
    @people = Person.all
    @news = News.is_previous(@month).is_published
    @events = Event.is_previous(@month).is_published
    @year = Date.today.year
    @display_month = "#{@year}-#{@month}-1".to_date.strftime("%B")

    @news_has_next = News.is_previous((DateTime.now + 1.month).month).is_published.any?
    @news_has_previous = News.is_previous((DateTime.now - 1.month).month).is_published.any?

    @events_has_next = Event.is_previous((DateTime.now + 1.month).month).is_published.any?
    @events_has_previous = Event.is_previous((DateTime.now - 1.month).month).is_published.any?
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