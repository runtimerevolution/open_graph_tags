require 'helper'

describe "OpenGraphTags" do

  context "Configurations" do
    it "should raise error if config parameters aren't in the list" do
      OpenGraphTags.configure(:invalid_key => 'invalid_key_value')
      OpenGraphTags.config.keys.should_not include(:invalid_key)
    end

    it "should not allow DEFAULT_PROVIDERS override Constant" do
      expect { OpenGraphTags.DEFAULT_PROVIDERS << :new_provider }.to raise_error
    end

    it "should allow config parameters override" do
      providers = [:twitter, :new_provider]
      OpenGraphTags.configure(:providers => providers)
      OpenGraphTags.config[:providers].should eq(providers)
    end
  end
end