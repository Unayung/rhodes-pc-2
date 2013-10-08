class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  def landing
    if params[:month].present?
      @month = params[:month]
    else
      @month = Date.today.month
    end
    @people = Person.all
    @news = News.is_previous(@month).is_published
    @year = Date.today.year
    @display_month = "#{@year}-#{@month}-1".to_date.strftime("%B")
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