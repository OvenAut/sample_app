require 'spec_helper'

describe Relationship do

  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email=> Factory.next(:email))

    #@relationship = @follower.relationship.build(:followed_id => @followed.id)
    @attr ={ :followed_id => @followed.id}
  end

  it "sould crate a new instance given valid attributes" do
    #@relationship.save!
    @follower.relationships.create!(@attr)
  end
  
  describe "follow methods" do
    
    before(:each) do
          @relationship = @follower.relationships.create!(@attr)
    end
    
    it "should have a follower atrriebut" do
      @relationship.should respond_to(:follower)
    end
    
    it "should have the right follower" do
    @relationship.follower.should == @follower
    end

    it "should have a follwed atrriebut" do
      @relationship.should respond_to(:followed)
    end
    
    it "should have the right followed user" do
    @relationship.followed.should == @followed
    end
  end

  describe "validations" do
    it "should reyuire a fallower id" do
      Relationship.new(@attr).should_not be_valid
    end
    
    it "should require a followed id" do
      @follower.relationships.build.should_not be_valid
    end
  end
  
end

