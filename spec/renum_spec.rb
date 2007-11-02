require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../lib/renum')

enum :Status, [ :NOT_STARTED, :IN_PROGRESS, :COMPLETE ]

enum :Color, [ :RED, :GREEN, :BLUE ] do
  def abbr
    name[0..0]
  end
end

describe "enum" do
  
  it "creates a class for the value type" do
    Status.class.should == Class
  end
  
  it "makes each value an instance of the value type" do
    Status::NOT_STARTED.class.should == Status
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
  
  it "allows an associated block to define instance methods" do
    Color::RED.abbr.should == "R"
  end
  
  it "provides a reasonable to_s for values" do
    Status::NOT_STARTED.to_s.should == "Status::NOT_STARTED"
  end
  
  it "makes values comparable" do
    Color::RED.should < Color::GREEN
  end
  
end