# Controller extension
module OpenGraphTags

  module MetaTags

    def self.included(base)
      base.send(:before_filter, :set_meta_tags) if base.respond_to?(:before_filter)
    end

    # before_filter to set predefined meta tags
    def set_meta_tags
      @meta_tags ||= Hash.new
      @meta_tags[:url] = request.fullpath
    end

    # method that allows to override predefined meta tags
    def meta_tags(tags = {})
      @meta_tags = (@meta_tags || {}).merge(tags)
      return @meta_tags
    end

  end

end