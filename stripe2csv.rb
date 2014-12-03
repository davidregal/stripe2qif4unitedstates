#!/usr/bin/env ruby

require 'optparse'
require 'date'

module Meanbee
  require 'stripe'
  
  class StripeCsv
    def initialize(api_key, from_date, count)
      @csv = Csv.new
      @from_timestamp = DateTime.parse(from_date).strftime('%s')
      @count = count

      Stripe.api_key = api_key
    end

    def process
      transfers = Stripe::Transfer.all(:count => @count, :date => { :gt => @from_timestamp })

      transfers.each do |transfer|
        date = Time.at(transfer.date).to_datetime.strftime("%m/%d/%Y")
        net_amount = transfer.amount.to_f / 100
        fee_amount = transfer.summary.charge_fees.to_f / 100
        gross_amount = net_amount + fee_amount
        currency = transfer.currency.upcase

        # balance_transaction object is retrieved but no extra info. I want to get a list of the charges that were included in this transfer.
        # obj_balance_transaction = Stripe::BalanceTransaction.retrieve(transfer.balance_transaction)
        # For example, obj_balance_transaction.description is the same as transfer.description. I need to get to the charges level in a reliable way.
        desc_prefix = "stripe " + transfer.balance_transaction
        @csv.add date, desc_prefix + " Gross amount", gross_amount
        @csv.add date, desc_prefix + " Net amount", -net_amount
        @csv.add date, desc_prefix + " Fee", -fee_amount
      end
    end

    def print
      @csv.print
    end
  end
  
  class Csv
    def initialize()
      @items = []
    end
    
    def add(date, desc, amount)
      @items << {
        :date => date,
        :desc => desc,
        :amount => amount
      }
    end
    
    def print
      lines = []
      
      @items.each do |item|
        lines << item[:date] + "," + item[:desc] + "," + "%.2f" % item[:amount]
      end
      
      lines << "\n" # Empty line
      
      lines.join "\n"
    end
  end
end

options = {}

options[:from] = '01/01/1900'
options[:count] = 100

optparse = OptionParser.new do |opts|
    opts.banner = "Usage: stripe2csv.rb --api-key STRIPE_API_KEY"

    opts.on('--api-key STRIPE_API_KEY', 'Stripe API key, required.') do |f|
        options[:api_key] = f
    end

    opts.on('--from dd/mm/yyyy', 'A date to list all transfers after, exclusive. If not specified, start of time is used.') do |f|
        options[:from] = f
    end

    opts.on('--count COUNT', 'The maximum number of transfers to return.  Maximum is 100, will assume 100 if not provided.') do |f|
        options[:count] = f
    end

    opts.on('-h', '--help', 'Display this screen') do |f| 
        puts opts
        exit
    end 
end

optparse.parse!

begin
    raise OptionParser::MissingArgument if options[:api_key].nil?
rescue
    puts 'Error: Missing required options.'
    puts optparse
    exit 1
end

csv = Meanbee::StripeCsv.new(options[:api_key], options[:from], options[:count])
csv.process

puts csv.print
