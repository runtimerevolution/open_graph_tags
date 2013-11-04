# Controller extension
module OpenGraphTags

  module MetaTags

  	def self.included(base)
    	base.send(:before_filter, :set_meta_tags)
  	end

  	# before_filter to fetch meta tags from a cms file
  	def set_meta_tags
  		if @cms_page
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
      elsif Cms::Page.where(:full_path => "/#{request.url.split("/")[3..-1].join("/")}").any?
      	@cms_page = Cms::Page.where(:full_path => "/#{request.url.split("/")[3..-1].join("/")}").first
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
    	else 
    		@cms_page = Cms::Page.root
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
        @meta_tags[:url] = request.env['PATH_INFO']
      end
      
    end

    # method that allows to override predefined meta tags
    def meta_tags(tags = {})
    	@meta_tags = @meta_tags.merge(tags)
    end

  end

end