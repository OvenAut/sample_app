require 'spec_helper'

describe Micropost do
  before(:each) do
    @user = Factory(:user)
    @attr = {:content => "Lorem ipsum", :user_id => 1}
  end
  
  it "should create a new instance withe valid attriebute" do
    @user.microposts.create!(@attr)
  end
  
  describe "user association" do
    before(:each) do
      @micropost = @user.microposts.create(@attr)
    end
    
    it "should have a user attriebute" do
      @micropost.should respond_to(:user)
    end
    it "should have the right association user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end
  end
  describe "validations" do
    it "shouldhave a user id" do
      Micropost.new(@attr).should_not be_valid
    end
    
    it "should require nonblank content" do
      @user.microposts.build(:content=> "    ").should_not be_valid
    end
    
    it "shouldreject long content" do
      @user.microposts.build(:content=>"a" * 141).should_not be_valid
    end
  end
end
