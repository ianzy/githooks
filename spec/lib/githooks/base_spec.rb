require (File.expand_path('../../../spec_helper', __FILE__))

describe Githooks::Base do
  
end

describe String do
  describe ".underscore" do |variable|
    it "should duplicate the string" do
      str1 = "test"
      str2 = str1.underscore
      str1.equal?(str2).should be_false
    end
    
    it "should change camel case to underscore" do
      "ThisIsATest".underscore.should eq "this_is_a_test"
    end
  end
end