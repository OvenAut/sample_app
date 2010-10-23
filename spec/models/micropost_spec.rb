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
  
  describe "from_users_followed_by" do
    
    before(:each) do
      @other_user = Factory(:user, :email => Factory.next(:email))
      @third_user = Factory(:user, :email => Factory.next(:email))

      @user_post = @user.microposts.create!(:content => "foo")
      @other_post = @other_user.microposts.create!(:content => "bar")
      @third_post = @third_user.microposts.create!(:content => "baz")

      @user.follow!(@other_user)
    end
    
    
    it "should have a from_users_followed_by method" do
      Micropost.should respond_to(:from_users_followed_by)
    end
    
    it "should includes the followed users microposts" do
      Micropost.from_users_followed_by(@user).should include(@other_post)
    end
    
    it "should include the users own microposts" do
      Micropost.from_users_followed_by(@user).should include(@user_post)      
    end
    
    it "should not include on unfallowed users microposts" do
      Micropost.from_users_followed_by(@user).should_not include(@third_post)
    end
  end
end
