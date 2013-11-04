module OpenGraphTags

	module ViewHelpers

	  def open_graph_meta_tags
	  	binding.pry
	    render :partial => "open_graph_tags/metatags", :locals => @meta_tags
	  end

	end
	
end