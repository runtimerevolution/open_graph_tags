require 'helper'

class MetaTagsDummyClass

  def self.before_filter(action)
  end

  include ::OpenGraphTags::MetaTags
end

describe "MetaTags Module" do

  context "Public API" do
    let(:meta_info) { MetaTagsDummyClass.new }

    it "should respond to the method 'set_meta_tags'" do
      meta_info.should respond_to(:set_meta_tags)
    end

    it "should respond to the method 'meta_tags'" do
      meta_info.should respond_to(:meta_tags)
    end

  end
end