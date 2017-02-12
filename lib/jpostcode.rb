# frozen_string_literal: true
require 'jpostcode/version'
require 'jpostcode/address'
require 'json'

module Jpostcode
  DATA_DIR = File.dirname(__FILE__) + '/../jpostcode-data/data/json/'

  module_function

  def find(raw_zip_code)
    zip_code = raw_zip_code.delete('-')

    json_file = DATA_DIR + zip_code.slice(0, 3) + '.json'

    return false unless File.exist?(json_file)

    data = JSON.parse(File.open(json_file).read)
    address_data = data[zip_code.slice(3, 4)]

    if address_data.instance_of?(Array)
      results = []
      address_data.each do |a|
        results.push Jpostcode::Address.new(a)
      end
      return results
    end

    address_data ? Jpostcode::Address.new(address_data) : false
  end
end
