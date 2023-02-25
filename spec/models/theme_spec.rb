require 'rails_helper'

RSpec.describe 'themeモデル機能', type: :model do
    describe 'バリデーションのテスト' do
        context 'テーマのタイトルが空の場合' do
          it 'バリデーションにひっかる' do
            theme = Theme.new(title: '', content: '失敗テスト')
            expect(theme).not_to be_valid
          end
        end
        context 'テーマの内容が空の場合' do
          it 'バリデーションにひっかかる' do
            theme = Theme.new(title: '失敗テスト', content: '')
            expect(theme).not_to be_valid
          end
        end
        context 'タスクのタイトルと詳細に内容が記載されている場合' do
          it 'バリデーションが通る' do
            user = FactoryBot.create(:user)
            theme = Theme.new(title: '失敗テスト', content: '失敗テスト',user_id: user.id)
            expect(theme).to be_valid
          end
        end
    end  
end