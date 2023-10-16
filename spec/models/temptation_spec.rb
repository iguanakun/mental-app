require 'rails_helper'

RSpec.describe Temptation, type: :model do
  let(:temptation) { FactoryBot.build(:temptation) }
  describe '脱フュージョン新規投稿' do
    context '新規投稿できる場合' do
      it '全ての投稿情報が存在すれば登録できる' do
        expect(temptation).to be_valid
      end
      it 'eventが空でも登録できる' do
        temptation.event = ''
        expect(temptation).to be_valid
      end
      it 'talkが空でも登録できる' do
        temptation.talk = ''
        expect(temptation).to be_valid
      end
      it 'costが空でも登録できる' do
        temptation.cost = ''
        expect(temptation).to be_valid
      end
      it 'get_outが空でも登録できる' do
        temptation.get_out = ''
        expect(temptation).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it '全ての情報が空では登録できない' do
        temptation.event = ''
        temptation.talk = ''
        temptation.cost = ''
        temptation.get_out = ''
        temptation.valid?
        expect(temptation.errors.full_messages).to include('Data is invalid') 
      end
      it 'userが紐づいていなければ登録できない' do
        temptation.user = nil
        temptation.valid?
        expect(temptation.errors.full_messages).to include('User must exist') 
      end
    end
  end
end
