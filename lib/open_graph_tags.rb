require "open_graph_tags/version" 
require "open_graph_tags/meta_info"
require "open_graph_tags/meta_tags"
require "open_graph_tags/view_helpers"

module OpenGraphTags

	# include meta information module on Cms::Page
	::Cms::Page.send(:include, MetaInfo) if defined?(MetaInfo) && defined?(Cms::Page)

	::ActionView::Base.send :include, ViewHelpers

end


