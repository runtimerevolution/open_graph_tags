require "open_graph_tags/version" 
require "open_graph_tags/engine"
require "open_graph_tags/meta_tags"

module OpenGraphTags

	# Configuration defaults
  @config = {
              :root_uri => "/"
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


