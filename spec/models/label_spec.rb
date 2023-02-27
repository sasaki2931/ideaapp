require 'rails_helper'


RSpec.describe Label, type: :model do
  describe 'バリデーションのテスト' do
      context 'テーマのラベルが未選択の場合' do
        it 'バリデーションが通る' do
          user = FactoryBot.create(:user)
          theme = Theme.new(title: 'ラベルなし', content: '失敗テスト',user_id: user.id,label_ids: [""])
          expect(theme).to be_valid  
        end
      end
   end
end








