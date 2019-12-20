# frozen_string_literal: true

# Monkey patch ActionView::Base#render to support ActionView::Component
#
# A version of this monkey patch was upstreamed in https://github.com/rails/rails/pull/37919
# We'll need to upstream an updated version of this eventually.
module ActionView
  module Component
    module RenderingMonkeyPatch # :nodoc:
      def _normalize_args(action = nil, options = {})
        if action.respond_to?(:render_in)
          options = super(action, options)
          options[:object] = action
          options
        else
          super
        end
      end
    end
  end
end
