class Api::V1::ApplicationController < ActionController::API

  def respond_with(resource, **options)
    ApplicationResponder.(self, resource, options)
  end
end