
module OpenGraphTags

  require "open_graph_tags/version"

  require "open_graph_tags/meta_info"
  require "open_graph_tags/meta_tags"

  require "open_graph_tags/engine"


  DEFAULT_PROVIDERS = [:twitter, :facebook, :google].freeze

	# Configuration defaults
  @config = {
    :root_uri => "/",
    :cms_page => defined?(::Cms::Page) ? ::Cms::Page : nil,
    :providers => DEFAULT_PROVIDERS
  }

  @valid_config_keys = @config.keys

  # Configure through hash
  def self.configure(opts = {})
    opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
  end

  def self.config
    @config
  end

end


