require "open_graph_tags/version" 
require "open_graph_tags/meta_info"

module OpenGraphTags

	# include meta information module on Cms::Page
	::Cms::Page.send(:include, MetaInfo) if defined?(MetaInfo) && defined?(Cms::Page)

end


