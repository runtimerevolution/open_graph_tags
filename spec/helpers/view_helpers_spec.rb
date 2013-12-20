require 'helper'

class DummyHelper
  include OpenGraphTags::ViewHelpers
end

describe 'ViewHelpers Module' do

  context "Public API" do

    let(:helper) { DummyHelper.new }

    it "should respond to open_graph_meta_tags" do
      helper.should respond_to(:open_graph_meta_tags)
    end

    it "should respond to different_providers method" do
      helper.should respond_to(:different_providers)
    end

    OpenGraphTags.config[:providers].each do |provider|
      it "should respond to #{provider}_meta_tag" do
        helper.should respond_to("#{provider}_meta_tag")
      end
    end

  end
end