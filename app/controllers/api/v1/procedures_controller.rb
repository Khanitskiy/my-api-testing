require_dependency "api/v1/application_controller"

class Api::V1::ProceduresController < ApplicationController

  def index
    repository = ProceduresRepository.new(resources_query.to_h)
    respond_with repository.content,
      fields: { procedure: %i(name) },
      meta: repository.meta
  end

  def show
    respond_with resource, fields: { procedure: %i(name) }
  end

  private

  def resources_query
    params.permit(:search, page: {})
  end

  def resource
    return @resource if defined? @resource
    query = ProceduresRepository::QueryObject.new
    @resource = query.scope.find(params[:id])
  end
end
