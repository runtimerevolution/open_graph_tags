require 'uri'

module OpenGraphTags
	module ViewHelpers

		include OpenGraphTags::MetaTags

		# partial rendering helper
		def open_graph_meta_tags
			set_meta_tags if meta_tags.keys.empty?
			render :partial => "open_graph_tags/metatags", :locals => { :metatags => @meta_tags }
		end

		# tags helpers
		def facebook_meta_tag(tag_name, content)
			if OpenGraphTags.config[:providers].include?(:facebook)
				tag(:meta, :content => content, :property => "og:#{tag_name}") unless content.blank?
			end
		end

		def twitter_meta_tag(tag_name, content)
			if OpenGraphTags.config[:providers].include?(:twitter)
				tag(:meta, :content => content, :name => "twitter:#{tag_name}") unless content.blank?
			end
		end

		def google_meta_tag(tag_name, content)
			if OpenGraphTags.config[:providers].include?(:google)
				tag(:meta, :content => content, :itemprop => tag_name) unless content.blank?
			end
		end

		def different_providers
			return (OpenGraphTags.config[:providers] - OpenGraphTags::DEFAULT_PROVIDERS)
		end

		def get_absolute_url(url, host)
			uri = URI(url)
			unless uri.absolute? || host.blank?
				uri_host = URI(host)
				uri.scheme = uri_host.scheme if uri_host.scheme
				uri.host = uri_host.host
			end
			uri.to_s
		end

	end
end