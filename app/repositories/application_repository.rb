class ApplicationRepository
  class QueryObject

    attr_reader :scope

    def initialize(context: {})
      @context = context
      @scope = build_scope
    end

    def select
      self
    end

    def search(text)
      self
    end

    def sort(text)
      self
    end

    def page(args)
      size = args.fetch(:size, 25).to_i
      x = args.fetch(:number, 1).to_i - 1
      @scope = @scope.limit(size).offset(x * size)
      self
    end

    def count
      @scope.count
    end

    private

    def build_scope
      raise NotImplementedError
    end
  end

  PAGE_ENUM = %i(size number)

  def initialize(params = {})
    params = params.deep_symbolize_keys
    @page_args = build_page_args(params)
    @search_text = build_search_text(params)
  end

  def content
    build_query
      .select
      .page(@page_args)
      .sort(@search_text)
      .scope
  end

  def meta
    query = build_query

    {
      records_count: query.count
    }
  end

  private

  def build_query
    self.class.const_get(:QueryObject)
      .new
      .search(@search_text)
  end

  def build_page_args(params)
    return {} unless params.has_key?(:page) && Hash === params[:page]
    params[:page].slice(*page_enum)
  end

  def build_search_text(params)
    return unless params.has_key?(:search)
    String(params[:search])
  end

  def page_enum
    PAGE_ENUM
  end
end