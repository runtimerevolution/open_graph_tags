module OpenGraphTags

	module ViewHelpers

		# partial rendering helper

	  def open_graph_meta_tags
	    render :partial => "open_graph_tags/metatags", :locals => @meta_tags
	  end

	  # tags helpers

	  def facebook_meta_tag(tag_name, content)
	  	tag(:meta, :content => content, :property => "og:#{tag_name}") unless content.blank?
	  end

	  def twitter_meta_tag(tag_name, content)
	  	tag(:meta, :content => content, :name => "twitter:#{tag_name}") unless content.blank?
	  end

	  def google_meta_tag(tag_name, content)
	  	tag(:meta, :content => content, :itemprop => tag_name) unless content.blank?
	  end

	end
	
end