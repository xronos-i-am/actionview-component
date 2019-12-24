# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout false

  def variants
    request.variant = params[:variant].to_sym if params[:variant]
  end

  def controller_inline
    render(object: ErbComponent, message: "bar") { "Foo" }
  end
end
