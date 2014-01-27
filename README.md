# OpenGraphTags

[![Build Status](https://travis-ci.org/runtimerevolution/open_graph_tags.png?branch=master)](https://travis-ci.org/runtimerevolution/open_graph_tags)
[![Code Climate](https://codeclimate.com/repos/52b42b3489af7e2e0f05942c/badges/dce4050b61531e1b0447/gpa.png)](https://codeclimate.com/repos/52b42b3489af7e2e0f05942c/feed)

**OpenGraphTags** is a tool developed to fully integrate the concept of open-graph tags with your application. The value of providing structured data through the Open Graph means that your pages will show up richly across different social networks like Twitter, Google+ or Facebook.

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

# Compability

## Rails

**OpenGraphTags** supports Rails 3 and 4.

# Note on Patches/Pull Requests

- Fork the Project.
- Make your feature addition or bug fix.
- Add tests for it. This is important so we don't break it in a future version unintentionally.
- Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
- Send us a pull request. Bonus points for topic branches.

# License

Copyright © 2013 [Runtime Revolution](http://www.runtime-revolution.com), released under the MIT license.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/59be37fe81712a1a4dadc798325a30ee "githalytics.com")](http://githalytics.com/runtimerevolution/open_graph_tags)