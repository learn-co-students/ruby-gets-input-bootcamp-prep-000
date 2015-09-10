require_relative "../lib/hello_ruby_programmer.rb"

describe './lib/hello_ruby_programmer.rb' do
  it 'defines a greeting method' do
    expect(defined?(greeting)).to be_truthy
  end

  context '#greeting' do 
    it 'takes in an argument of a persons name' do 
      expect {greeting("Bobby")}.to_not raise_error
    end

    it 'greets the person whose name was passed in as an argument' do
      expect(greeting("Sally")).to eq("Hi, Sally! Welcome to the wonderful world of Ruby programming.") 
    end
  end
end