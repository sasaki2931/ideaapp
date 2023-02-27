require 'rails_helper'
RSpec.describe 'Labelモデル', type: :model do
  describe 'バリデーションのテスト' do
    context 'contentが空の場合' do
      it 'バリデーションが引っかかる' do
        label = Label.new(name: '')
        expect(label).not_to be_valid
      end
    end
  end

  describe 'ラベル登録' do
    context '入力に不足がない時' do
      it 'ラベル登録が成功する' do
        label = Label.new(name: '地域問題')
        expect(label).to be_valid
      end
    end
  end
end



