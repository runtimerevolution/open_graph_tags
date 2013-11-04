require "open_graph_tags/version"
require 

module OpenGraphTags

	# include meta information module on Cms::Page
	Cms::Page.send(:include, MetaInfo) if defined?(MetaInfo)

end
