require (File.expand_path('../../../spec_helper', __FILE__))

describe Githooks::Base do
  before(:all) do
    class TestHook < Githooks::Base
    end
  end
  
  it "should created methods for Kernel" do
    t = TestHook.new
    respond_to?(:test_hook).should be_true
    respond_to?(:each_hook).should be_true
  end
  
end