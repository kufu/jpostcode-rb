# frozen_string_literal: true

module Jpostcode
  class Address
    attr_reader :zip_code, :prefecture, :prefecture_kana, :prefecture_code,
                :city, :city_kana, :town, :town_kana, :street,
                :office_name, :office_name_kana

    def initialize(data)
      @zip_code         = data['zip_code']
      @prefecture       = data['prefecture']
      @prefecture_kana  = data['prefecture_kana']
      @prefecture_code  = data['prefecture_code']
      @city             = data['city']
      @city_kana        = data['city_kana']
      @town             = data['town']
      @town_kana        = data['town_kana']
      @street           = data['street']
      @office_name      = data['office_name']
      @office_name_kana = data['office_name_kana']
    end
  end
end
