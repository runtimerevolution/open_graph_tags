require 'rails'

require 'open_graph_tags/meta_tags'

require 'open_graph_tags/view_helpers'

module OpenGraphTags
  class Engine < Rails::Engine

    initializer "open_graph_tags.view_helpers" do
      ActionView::Base.send(:include, ViewHelpers)
    end
    
  end
end