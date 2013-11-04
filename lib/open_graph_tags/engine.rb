require 'rails'
require "open_graph_tags/view_helpers"
require "open_graph_tags/meta_info"

module OpenGraphTags
  class Engine < Rails::Engine
  	initializer "open_graph_tags.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer "meta_info" do
    	if defined?(ComfortableMexicanSofa)
    		Cms::Page.send :include, MetaInfo
    	end
    end
  end
end