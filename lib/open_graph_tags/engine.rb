require 'rails'
require "open_graph_tags/view_helpers"

module OpenGraphTags
  class Engine < Rails::Engine

    initializer "open_graph_tags.view_helpers" do
      ActionView::Base.send(:include, ViewHelpers)
    end

    initializer "meta_info" do
      Cms::Page.send(:include, MetaInfo) if defined?(ComfortableMexicanSofa)
    end
  end
end