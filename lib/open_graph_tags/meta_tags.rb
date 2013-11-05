# Controller extension
module OpenGraphTags

  module MetaTags

  	def self.included(base)
    	base.send(:before_filter, :set_meta_tags)
  	end

  	# before_filter to fetch meta tags from a cms file
  	def set_meta_tags
      request_uri = request.env['PATH_INFO']

  		if @cms_page
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
      elsif @cms_page = get_cms_page_for(request_uri)
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
      else 
  		  @cms_page = Cms::Page.root
        @meta_tags = @cms_page.meta_information if @cms_page.respond_to?(:meta_information)
        @meta_tags[:url] = request_uri
      end
    end

    # method that allows to override predefined meta tags
    def meta_tags(tags = {})
    	@meta_tags = @meta_tags.merge(tags)
    end

    private

    def get_cms_page_for(request_uri)
      root_uri = OpenGraphTags.config[:root_uri]
      Cms::Page.where(:full_path => "/#{request_uri.split(root_uri)[1..-1].join("/")}").first rescue nil
    end

  end

end