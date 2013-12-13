module OpenGraphTags
	module ViewHelpers

		# partial rendering helper
		def open_graph_meta_tags
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

	end
end