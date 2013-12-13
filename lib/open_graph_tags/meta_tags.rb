# Controller extension
module OpenGraphTags

  module MetaTags

    def self.included(base)
      base.send(:before_filter, :set_meta_tags)
    end

    # before_filter to fetch meta tags from a cms file
    def set_meta_tags
      @meta_tags ||= Hash.new

      return unless @cms_page.respond_to?(:meta_information)

      request_uri = request.env['PATH_INFO']

      if @cms_page
        @meta_tags = @cms_page.meta_information
      elsif @cms_page = get_cms_page_for(request_uri)
        @meta_tags = @cms_page.meta_information
      elsif @cms_page = OpenGraphTags.config[:cms_page].try(:root)
        @meta_tags = @cms_page.meta_information
        @meta_tags[:url] = request_uri if @meta_tags
      end
    end

    # method that allows to override predefined meta tags
    def meta_tags(tags = {})
      @meta_tags = (@meta_tags || {}).merge(tags)
    end

    private

    def get_cms_page_for(request_uri)
      path = "/#{request_uri.split(OpenGraphTags.config[:root_uri])[1..-1].join("/")}"
      OpenGraphTags.config[:cms_page].where(:full_path => path).first
    end

  end

end