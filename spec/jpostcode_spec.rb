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
        let(:postcode) { '438-0078' }
        it 'returns array of addresses for the code' do
          expect(result.class).to eq(Array)

          expect(result[0].prefecture).to eq('静岡県')
          expect(result[0].prefecture_kana).to eq('シズオカケン')
          expect(result[0].city).to eq('磐田市')
          expect(result[0].city_kana).to eq('イワタシ')
          expect(result[0].town).to match('旭ケ丘')
          expect(result[0].town_kana).to match('アサヒガオカ')
          expect(result[0].prefecture_code).to eq(22)

          expect(result[1].prefecture).to eq('静岡県')
          expect(result[1].prefecture_kana).to eq('シズオカケン')
          expect(result[1].city).to eq('磐田市')
          expect(result[1].city_kana).to eq('イワタシ')
          expect(result[1].town).to match('石原町')
          expect(result[1].town_kana).to match('イシワラチョウ')
          expect(result[1].prefecture_code).to eq(22)

          expect(result[2].prefecture).to eq('静岡県')
          expect(result[2].prefecture_kana).to eq('シズオカケン')
          expect(result[2].city).to eq('磐田市')
          expect(result[2].city_kana).to eq('イワタシ')
          expect(result[2].town).to match('泉町')
          expect(result[2].town_kana).to match('イズミチョウ')
          expect(result[2].prefecture_code).to eq(22)
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
  end
end
