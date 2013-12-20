require 'helper'

class MetaInfoDummyClass
  include ::OpenGraphTags::MetaInfo
end

describe "MetaInfo Module" do

  context "Public API" do
    let(:meta_info) { MetaInfoDummyClass.new }

    it "should respond to the method 'meta_information'" do
      meta_info.should respond_to(:meta_information)
    end

    it "should respond to any method started with the prefix 'get_meta_tag'" do
      %w(title description image_name).each do |name|
        expect { meta_info.send("get_meta_tag_#{name}") }.not_to raise_error
      end
    end

    it "should raise an error for any call without the prefix requirements fulfilled" do
      expect { meta_info.send("invalid_method") }.to raise_error
    end
  end
end