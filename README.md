# Jpostcode [![CircleCI](https://circleci.com/gh/kakipo/jpostcode-rb.svg?style=svg)](https://circleci.com/gh/kakipo/jpostcode-rb)

Tiny gem to manipulate Japan postcode.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jpostcode'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jpostcode

## Usage

Basic one:

```ruby
address = Jpostcode.find('154-0011')
address.prefecture      # 東京都
address.prefecture_kana # トウキョウト
address.prefecture_code # 13
address.city            # 世田谷区
address.city_kana       # セタガヤク
address.town            # 上馬
address.town_kana       # カミウマ
address.zip_code        # 1540011
```

When the code covers multiple addresses:

```ruby
addresses = Jpostcode.find('0110951')
addresses.class # Array
addresses.each do |address|
  puts address.town
end

# => 土崎港相染町
# => 土崎港古川町
```

Office postcodes are also available:

```ruby
address = Jpostcode.find('113-8654')
address.prefecture        # 東京都
address.prefecture_kana   # トウキョウト
address.prefecture_code   # 13
address.city              # 文京区
address.city_kana         # ブンキョウク
address.town              # 本郷
address.town_kana         # ホンゴウ
address.street            # ７丁目３−１
address.office_name       # 東京大学　本部事務組織
address.office_name_kana  # トウキヨウダイガク ホンブジムソシキ
address.zip_code          # 1138654
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kakipo/jpostcode-rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
