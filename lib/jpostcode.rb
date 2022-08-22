# frozen_string_literal: true

require 'jpostcode/version'
require 'jpostcode/address'
require 'json'

module Jpostcode
  DATA_DIR = "#{File.dirname(__FILE__)}/../jpostcode-data/data/json/"

  module_function

  def find(raw_zip_code)
    zip_code = raw_zip_code.to_s.delete('-')
    return nil unless zip_code.match?(/^\d{7,7}$/)

    json_file = "#{DATA_DIR}#{zip_code.slice(0, 3)}.json"
    return nil unless File.exist?(json_file)

    data = JSON.parse(File.read(json_file))
    address_data = data[zip_code.slice(3, 4)]
    return nil if address_data.nil?

    if address_data.instance_of?(Array)
      address_data.map { |a| Jpostcode::Address.new(a) }
    else
      Jpostcode::Address.new(address_data)
    end
  end
end
