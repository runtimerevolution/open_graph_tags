# OpenGraphTags

[![Build Status](https://travis-ci.org/runtimerevolution/open_graph_tags.png?branch=master)](https://travis-ci.org/runtimerevolution/open_graph_tags)
[![Code Climate](https://codeclimate.com/repos/52b42b3489af7e2e0f05942c/badges/dce4050b61531e1b0447/gpa.png)](https://codeclimate.com/repos/52b42b3489af7e2e0f05942c/feed)

**OpenGraphTags** is a tool developed to fully integrate the concept of open-graph tags with your application and also with [Comfortable Mexican Sofa](https://github.com/comfy/comfortable-mexican-sofa) gently. The value of providing structured data through the Open Graph means that your pages will show up richly across different social networks like Twitter, Google+ or Facebook.

## Installation

Add OpenGraphTags to your Gemfile:

```ruby
gem 'open_graph_tags', :git => 'git://github.com/runtimerevolution/open_graph_tags.git'
```

Then run bundle to install the Gem:

```
  bundle install
```

To correctly show open-graph tags in different pages of your application you have to include `open_graph_meta_tags` helper in your application layout as explained next:

```erb
<head>
  <title>My Rails Application</title>
  <%= open_graph_meta_tags %>
</head>
```


After this step, you're closer to have open-graph tags in your Rails application.

## Getting Started

If you want to use OpenGraphTags without the integration with comfy you just to need to call `meta_tags` in your controllers with a hash containing a the following parameters: **title**, **description** and **image**. If you omit one of those, it will be ignored while rendering the open-graph metatags for the different providers.

```ruby
class ArtistsController < Application::Controller
  def show
    @artist = params[:id].blank? ? Artist.first : Artist.find(params[:id])
    meta_tags(:title => @artist.name,
      :description => @artist.bio_resume,
      :image => @artist.picture(:index_thumb))
  end
end
```

## Configurations

By default we are rendering three different open-graph providers (facebook, google and twitter), but you can configure which  are the providers you want to show. For example, if you only want twitter and google open-graph tags you can create a initializer file with the following line:

```ruby
  OpenGraphTags.configure(:providers => [:twitter, :google])
```
If you want to extend the current functionality in your application to support another provider standards you can
easily integrate it with **OpenGraphTags** gem:

```ruby
  OpenGraphTags.configure(:providers => [:twitter, :google, :new_provider])
```

And also create your own helper methods: In your application_helper module add a method started by the name of the provider you've created:
```ruby
def new_provider_meta_tag(tag_name, content)
  tag(:meta, :content => content, :property => "new-provider-og:#{tag_name}")
end
```

## Integration with Comfortable Mexican Sofa

You can look at this [example-application](http://runtime-open-graph-example.herokuapp.com/) using COMFY and **OpenGraphTags** to better understand how to correctly use it in your project.

If you are using Comfy as your CMS, you probabily noticed the need to use open-graph tags across different pages. This feature can be a little bit harder if you want avoid code duplication in the COMFY pages.

**OpenGraphTags** help us to better integrate this feature with COMFY without code replication or potential breaking workarounds, since it only needs to inject a small DSL code snippet in your main layout:

```ruby
{{ cms:field:meta_tag_title:string }}
{{ cms:field:meta_tag_description:text }}
{{ cms:field:meta_tag_image_name:string }}

```

![alt text](https://dl.dropboxusercontent.com/u/45612140/layout_editing.png "Edit the Main layout")

Updating the main layout will automatically create meta-tag fields in all the pages that are using it. From now on it will be easier to override and customize open-graph content for your CMS pages.
![alt text](https://dl.dropboxusercontent.com/u/45612140/page_editing.png "Open Graph Fields in a CMS page")

After save your page meta content you can see in header of the page the following information:

```html
<meta content="Runtime Revolution" property="og:site_name" />
<meta content="Runtime Revolution" property="og:title" />
<meta content="http://runtime-open-graph-example.herokuapp.com/" property="og:url" />
<meta content="Lorem ipsum dolor sit amet." property="og:description" />

<meta content="http://runtime-open-graph-example.herokuapp.com/" name="twitter:url" />
<meta content="Runtime Revolution" name="twitter:title" />
<meta content="Lorem ipsum dolor sit amet." name="twitter:description" />

<meta content="runtime-revolution" itemprop="name" />
<meta content="Lorem ipsum dolor sit amet." itemprop="description" />
```

## Override Default Metatags

If you are using Comfortable Mexican Sofa by default, OpenGraphTags is fetching content of your CMS Pages to look by references from **meta_tag_title**, **meta_tag_description** and **meta_tag_image_name** and extract information of those fields. OpenGraphTags is using an hierarchical finder, i.e. if you have a child page without meta tags content, the finder will look at the parent of that page in order find valid open-graph contents (it will do it until reach to root page). If you want to override the default behavior in specific circunstances you can set your own meta_tag information in the controller class instead. Let's look at the following code:

```ruby
def ApplicationController ActionController::Base

  before_filter :override_meta_tags_content

  def override_meta_tags_content
    if !@cms_page.nil? && @cms_page.name == 'target_page'
      meta_tags(:title => site.name,
        :description => sinopse,
        :image => default_site_image)
    end
  end
end
```

# Compability

## Rails

**OpenGraphTags** supports Rails 3 and 4.

## Comfortable Mexican Sofa

**OpenGraphTags** supports all versions in the MAJOR RELEASE 1.x.x.

# Note on Patches/Pull Requests

- Fork the Project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so we don't break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send us a pull request. Bonus points for topic branches.

# Roadmap

- Add different modes to set new metatags (in views for example).
- Add rake task to automatically generate the COMFY structure needed for smoother integration.

# License

Copyright © 2013 [Runtime Revolution](http://www.runtime-revolution.com), released under the MIT license.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/59be37fe81712a1a4dadc798325a30ee "githalytics.com")](http://githalytics.com/runtimerevolution/open_graph_tags)