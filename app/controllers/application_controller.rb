class ApplicationController < ActionController::API

  def respond_with(resource, **options)
    ApplicationResponder.(self, resource, options)
  end

end
