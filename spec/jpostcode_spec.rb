# frozen_string_literal: true
require 'spec_helper'

describe Jpostcode do
  describe '.find' do
    let(:result) { Jpostcode.find(postcode) }

    context 'when specified postcode exists' do
      context 'when there is only one address for the code' do
        let(:postcode) { '154-0011' }
        it 'returns a single record' do
          expect(result.prefecture).to eq('東京都')
          expect(result.prefecture_kana).to eq('トウキョウト')
          expect(result.prefecture_code).to eq(13)
          expect(result.city).to eq('世田谷区')
          expect(result.city_kana).to eq('セタガヤク')
          expect(result.town).to eq('上馬')
          expect(result.town_kana).to eq('カミウマ')
        end
      end

      context 'when there are some addresses for the code' do
        let(:postcode) { '011-0951' }
        it 'returns array of addresses for the code' do
          expect(result.class).to eq(Array)

          expect(result[0].prefecture).to eq('秋田県')
          expect(result[0].prefecture_kana).to eq('アキタケン')
          expect(result[0].city).to eq('秋田市')
          expect(result[0].city_kana).to eq('アキタシ')
          expect(result[0].town).to eq('土崎港相染町')
          expect(result[0].town_kana).to eq('ツチザキミナトソウゼンマチ')
          expect(result[0].prefecture_code).to eq(5)

          expect(result[1].prefecture).to eq('秋田県')
          expect(result[1].prefecture_kana).to eq('アキタケン')
          expect(result[1].city).to eq('秋田市')
          expect(result[1].city_kana).to eq('アキタシ')
          expect(result[1].town).to eq('土崎港古川町')
          expect(result[1].town_kana).to eq('ツチザキミナトフルカワマチ')
          expect(result[1].prefecture_code).to eq(5)
        end
      end

      context 'when the code is an office postcode' do
        let(:postcode) { '113-8654' }
        it 'returns an office address' do
          expect(result.prefecture).to eq('東京都')
          expect(result.prefecture_kana).to eq('トウキョウト')
          expect(result.prefecture_code).to eq(13)
          expect(result.city).to eq('文京区')
          expect(result.city_kana).to eq('ブンキョウク')
          expect(result.town).to eq('本郷')
          expect(result.town_kana).to eq('ホンゴウ')
          expect(result.street).to eq('７丁目３−１')
          expect(result.office_name).to eq('東京大学　本部事務組織')
          expect(result.office_name_kana).to eq('トウキヨウダイガク ホンブジムソシキ')
        end
      end
    end

    context 'when specified postcode DOES NTO exist' do
      context 'when the code is nil' do
        let(:postcode) { nil }
        it { expect(result).to be_nil }
      end

      context 'when the code is NOT a string' do
        let(:postcode) { 1_234_567 }
        it { expect(result).to be_nil }
      end

      context 'when the first 3 digits are valid, but the last digits are invalid' do
        let(:postcode) { '154-9999' }
        it { expect(result).to be_nil }
      end

      context 'when the first 3 digits are valid, but the last digits are invalid' do
        let(:postcode) { '154-0011XYZZY' }
        it { expect(result).to be_nil }
      end
    end
  end
end
