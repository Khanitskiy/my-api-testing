class ApplicationResponder
  attr_reader :controller, :request, :result

  delegate :request, :head, :render, to: :controller

  def self.call(controller, resource, **options)
    new(controller, resource, options).respond
  end

  def initialize(controller, resource, **options)
    @controller = controller
    @resource = resource
    @options = options
  end

  def respond
    return render_get if request.get?
    return render_unprocessable_entity if @resource.respond_to?(:errors) && @resource.errors.present?

    if request.post?
      render_post
    elsif request.patch?
      render_patch
    else
      render_no_content
    end
  end

  private

  def render_get
    render json: serialize_resource
  end

  def render_post
    render json: serialize_resource, status: :created
  end

  def render_patch
    render json: serialize_resource
  end

  def render_no_content
    head :no_content
  end

  def render_unprocessable_entity
    render json: resource_error_resource_class.new(@resource).serializable_hash, status: :unprocessable_entity
  end

  def serialize_resource
    resource_serializer_class.new(@resource, @options).serializable_hash
  end

  def resource_serializer_class
    Object.const_get("#{resource_class}Serializer")
  end

  def resource_error_resource_class
    ErrorSerializer
  end

  def resource_class
    return @resource_class if defined? @resource_class

    @resource_class = if ActiveRecord::Associations::CollectionProxy === @resource ||
      ActiveRecord::Relation === @resource
      @resource.class.to_s.split("::").yield_self do |nested|
        nested.pop
        nested.join("::").constantize
      end
    elsif @resource.respond_to?(:each)
      @resource.first.class
    else
      @resource.class
    end
  end
end