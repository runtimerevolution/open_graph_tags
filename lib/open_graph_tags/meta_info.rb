# Meta Info Module adds meta tag information into CMS Pages.
# This module was build around Comfy Models
module MetaInfo

  def self.included(base)
    base.send(:include, MetaInfo::InstanceMethods)
  end

  module InstanceMethods
    # meta_information is used to collect meta information arround pages
    # If the current page does not have meta information associated
    # it collects all the meta information from the parent if exists
    # otherwise fill in fields with blank strings
    def meta_information
      site_name = self.site.label
      url = self.full_path

      # checks the instance meta tag information
      title = self.get_meta_tag_title
      description = self.get_meta_tag_description
      image = self.get_meta_tag_image_name

      {
        :site_name => site_name,
        :title => (title or ""),
        :description => (description or ""),
        :image => (image or ""),
        :url => url
      }
    end

    private

    def method_missing(name, *args)
      method_name = name.to_s
      if method_name =~ /^get_meta_tag_(\w+)/
        meta_tag_id = method_name.match(/^get_meta_tag_(\w+)/)[1]
        meta_tag_content = self.blocks.where(:identifier => "meta_tag_#{meta_tag_id}").first.try(:content)

        # if no tag info found, call method for parent
        if meta_tag_content.blank? && self.parent_id
          return self.parent.send(name, args)
        else
          return meta_tag_content
        end
      else
        super
      end    
    end

  end
end