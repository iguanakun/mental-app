require 'rails_helper'

RSpec.describe Monitoring, type: :model do
  describe 'モニタリング新規投稿' do
    let(:monitoring) { FactoryBot.build(:monitoring) }

    context '新規投稿できる場合' do
      it '全ての投稿情報が存在すれば登録できる' do
        expect(monitoring).to be_valid
      end
      it 'factが空でも登録できる' do
        monitoring.fact = ''
        expect(monitoring).to be_valid
      end
      it 'mindが空でも登録できる' do
        monitoring.mind = ''
        expect(monitoring).to be_valid
      end
      it 'feelが空でも登録できる' do
        monitoring.feel = ''
        expect(monitoring).to be_valid
      end
      it 'bodyが空でも登録できる' do
        monitoring.body = ''
        expect(monitoring).to be_valid
      end
      it 'behaviorが空でも登録できる' do
        monitoring.behavior = ''
        expect(monitoring).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it '全ての情報が空では登録できない' do
        monitoring.fact = ''
        monitoring.mind = ''
        monitoring.feel = ''
        monitoring.body = ''
        monitoring.behavior = ''
        monitoring.valid?
        expect(monitoring.errors.full_messages).to include('Data is invalid') 
      end
      it 'userが紐づいていなければ登録できない' do
        monitoring.user = nil
        monitoring.valid?
        expect(monitoring.errors.full_messages).to include('User must exist') 
      end
    end
  end
end
