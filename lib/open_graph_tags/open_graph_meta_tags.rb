# Controller extension
module OpenGraphMetaTags

	def self.included(base)
  	base.send(:before_filter, set_meta_tags)
	end

	# before_filter to fetch meta tags from a cms file
	def set_meta_tags
		unless @cms_page
    	if Cms::Page.where(:full_path => "/#{request.url.split("/")[4..-1].join("/")}").any?
      	@cms_page = Cms::Page.where(:full_path => "/#{request.url.split("/")[4..-1].join("/")}").first
    	else 
    		@cms_page = Cms::Page.root
    	end    	
    end
    @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
  end

  # method that allows to override predefined meta tags
  def meta_tags(tags = {})
  	@meta_tags = @meta_tags.merge(tags)
  end

end