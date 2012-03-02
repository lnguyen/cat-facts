#!/usr/bin/env ruby

require 'optparse'
require 'googlevoiceapi'
require 'highline/import'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: cat <gmail> <password> <phonenumber>"


  opt.on("-h","--help","Display this screen") do
    puts opt_parser
  end
end

opt_parser.parse!

if ARGV.count < 3
  puts opt_parser
end

#password = ask("Enter your password: ") { |q| q.echo = "x" }
email = ARGV[0]
password = ARGV[1]
number = ARGV[2]

facts = open("facts.txt").readlines

api = GoogleVoice::Api.new(email,password)
api.sms(number,facts.sample)


