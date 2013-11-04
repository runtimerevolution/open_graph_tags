module OpenGraphHelper

  def open_graph_meta_tags
    render :partial => "metatags", :locals => @meta_tags
  end

end