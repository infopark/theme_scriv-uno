class SearchPageController < CmsController
  HITS_PER_PAGE = 10

  def index
    @query = params[:q] || ''
    @hits = []

    if @query.present?
      search_query = Obj.where(:*, :contains_prefix, @query)
      search_query.batch_size(HITS_PER_PAGE).offset(offset)

      @total = search_query.size
      @hits = search_query.take(HITS_PER_PAGE)

      if offset > 0
        @previous_page = scrivito_path(@obj, q: @query, offset: offset - HITS_PER_PAGE)
        @showing_page = offset / HITS_PER_PAGE + 1
      else
        @showing_page = 1
      end

      if @total > offset + HITS_PER_PAGE
        @next_page = scrivito_path(@obj, q: @query, offset: offset + HITS_PER_PAGE)
      end

      @total_pages = (@total / HITS_PER_PAGE.to_f).ceil
      @hits_per_page = HITS_PER_PAGE
    end
  end

  private

  def offset
    params[:offset].to_i
  end
end
