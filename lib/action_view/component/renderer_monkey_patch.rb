# frozen_string_literal: true

# Monkey patch ActionView::Base#render to support ActionView::Component
#
# A version of this monkey patch was upstreamed in https://github.com/rails/rails/pull/37919
# We'll need to upstream an updated version of this eventually.
module ActionView
  module Component
    module RendererMonkeyPatch # :nodoc:
      def render_to_object(context, options)
        if options.key?(:object)
          object = options[:object]
          AbstractRenderer::RenderedTemplate.new(object.new(options).render_in(context), object)
        else
          super
        end
      end
    end
  end
end
