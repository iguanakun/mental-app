require 'rails_helper'

RSpec.describe Temptation, type: :model do
  let(:temptation_form) { 
    user = FactoryBot.create(:user)
    FactoryBot.build(:temptation_form, user_id: user.id)  
  }

  describe '脱フュージョン新規投稿' do
    context '新規投稿できる場合' do
      it '全ての投稿情報が存在すれば登録できる' do
        expect(temptation_form).to be_valid
      end
      it 'eventが空でも登録できる' do
        temptation_form.event = ''
        expect(temptation_form).to be_valid
      end
      it 'talkが空でも登録できる' do
        temptation_form.talk = ''
        expect(temptation_form).to be_valid
      end
      it 'costが空でも登録できる' do
        temptation_form.cost = ''
        expect(temptation_form).to be_valid
      end
      it 'get_outが空でも登録できる' do
        temptation_form.get_out = ''
        expect(temptation_form).to be_valid
      end
      it 'tagが空でも登録できる' do
        temptation_form.tag_name = ''
        expect(temptation_form).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it '全ての情報が空では登録できない' do
        temptation_form.event = ''
        temptation_form.talk = ''
        temptation_form.cost = ''
        temptation_form.get_out = ''
        temptation_form.tag_name = ''
        temptation_form.valid?
        expect(temptation_form.errors.full_messages).to include('Data is invalid') 
      end
      it 'タグ以外が空では登録できない' do
        temptation_form.event = ''
        temptation_form.talk = ''
        temptation_form.cost = ''
        temptation_form.get_out = ''
        temptation_form.valid?
        expect(temptation_form.errors.full_messages).to include('Data is invalid') 
      end
      it 'userが紐づいていなければ登録できない' do
        temptation_form.user_id = nil
        temptation_form.valid?
        expect(temptation_form.errors.full_messages).to include("User can't be blank") 
      end
    end
  end
end
