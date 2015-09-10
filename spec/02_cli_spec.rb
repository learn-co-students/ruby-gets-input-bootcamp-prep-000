require_relative "../lib/hello_ruby_programmer.rb"

describe './bin/greeting executing a CLI Application' do
  it 'outputs a welcome message' do
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")
    expect($stdout).to receive(:puts).with("Hi! Welcome to the wonderful world of Ruby programming."), "Make sure bin/greeting has code that can output 'Hi! Welcome to the wonderful world of Ruby programming!' exactly."
    run_file("./bin/greeting")
  end

  it 'asks the user to input their name' do
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")
    expect($stdout).to receive(:puts).with("Please enter your name so that we can greet you more personally:"), "Make sure bin/greeting has code that can output 'Please enter your name so that we can greet you more personally:' exactly."
    run_file("./bin/greeting")
  end

  it 'uses #gets.strip to capture the user input and set it equal to a variable called name' do 
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")
    name = get_variable_from_file("./bin/greeting", "name")
    expect(name).to eq("Don")
    run_file("./bin/greeting")
  end

  it "calls on the #greeting method with an argument of the user's name" do 
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")
    expect(self).to receive(:greeting).with("Don")
    run_file("./bin/greeting")
  end

  it "uses the #puts method to output the string returned by calling the #greeting method with an argument of the user's name" do 
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")
    output = capture_puts{ run_file("./bin/greeting") }
    expect(output).to include("Hi, Don! Welcome to the wonderful world of Ruby programming.")
    run_file("./bin/greeting")
  end
end
