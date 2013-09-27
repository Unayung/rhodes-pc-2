class PagesController < HighVoltage::PagesController
  layout :layout_for_page

  def landing
    @people = Person.all
    @news = News.this_month
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