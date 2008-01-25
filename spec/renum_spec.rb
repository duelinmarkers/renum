require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

enum :Status, [ :NOT_STARTED, :IN_PROGRESS, :COMPLETE ]

module MyNamespace
  enum :FooValue, %w( Bar Baz Bat )
end

enum :Color, [ :RED, :GREEN, :BLUE ] do
  def abbr
    name[0..0]
  end
end

enum :Size do
  Small("Really really tiny")
  Medium("Sort of in the middle")
  Large("Quite big")

  attr_reader :description

  def init description
    @description = description
  end
end

enum :HairColor do
  BLONDE()
  BRUNETTE()
  RED()
end

describe "basic enum" do
  
  it "creates a class for the value type" do
    Status.should be_an_instance_of(Class)
  end
  
  it "makes each value an instance of the value type" do
    Status::NOT_STARTED.should be_an_instance_of(Status)
  end
  
  it "exposes array of values" do
    Status.values.should == [Status::NOT_STARTED, Status::IN_PROGRESS, Status::COMPLETE]
  end
  
  it "enumerates over values" do
    Status.map {|s| s.name}.should == %w[NOT_STARTED IN_PROGRESS COMPLETE]
  end
  
  it "indexes values" do
    Status[2].should == Status::COMPLETE
    Color[0].should == Color::RED
  end
  
  it "provides index lookup on values" do
    Status::IN_PROGRESS.index.should == 1
    Color::GREEN.index.should == 1
  end
  
  it "provides a reasonable to_s for values" do
    Status::NOT_STARTED.to_s.should == "Status::NOT_STARTED"
  end
  
  it "makes values comparable" do
    Color::RED.should < Color::GREEN
  end
end

describe "nested enum" do
  it "is namespaced in the containing module or class" do
    MyNamespace::FooValue::Bar.class.should == MyNamespace::FooValue
  end
end

describe "enum with a block" do
  it "can define additional instance methods" do
    Color::RED.abbr.should == "R"
  end
end

describe "enum with no values array and values declared in the block" do
  it "provides an alternative means of declaring values where extra information can be provided for initialization" do
    Size::Small.description.should == "Really really tiny"
  end
  
  it "works the same as the basic form with respect to ordering" do
    Size.values.should == [Size::Small, Size::Medium, Size::Large]
  end
  
  it "responds as expected to arbitrary method calls, in spite of using method_missing for value definition" do
    lambda { Size.ExtraLarge() }.should raise_error(NoMethodError)
  end
  
  it "supprts there being no extra data and no init() method defined, if you don't need them" do
    HairColor::BLONDE.name.should == "BLONDE"
  end
end