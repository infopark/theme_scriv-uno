class SearchPageController < CmsController

  def index
    @query = params[:q] || ''
    if @query.present?
      @hits = Obj.where(:*, :contains_prefix, @query).take(10)
    else
      @hits = []
    end
  end

end
