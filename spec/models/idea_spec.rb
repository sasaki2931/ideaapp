require 'rails_helper'


RSpec.describe Idea, type: :model do
    describe 'バリデーションのテスト' do
        context 'タイトルが空の場合' do
          it 'バリデーションにひっかる' do
            user = FactoryBot.create(:user)
            theme = FactoryBot.create(:theme,user_id: user.id)
            idea = Idea.new(title: '', content: 'aa',user_id: user.id,theme_id: theme.id)
            expect(idea).not_to be_valid
          end
        end
        context '内容が空の場合' do
          it 'バリデーションにひっかかる' do
            user = FactoryBot.create(:user)
            theme = FactoryBot.create(:theme,user_id: user.id)
            idea = Idea.new(title: 'aa', content:'',user_id: user.id,theme_id: theme.id)
            expect(idea).not_to be_valid
          end
        end
        context '画像が空の場合' do
            it 'バリデーションが通る' do
              user = FactoryBot.create(:user)
              theme = FactoryBot.create(:theme,user_id: user.id)
              idea =  FactoryBot.create(:idea,img: '',user_id: user.id,theme_id: theme.id)
              expect(idea).to be_valid
            end
        end
      context '全ての値があるとき' do
        it 'バリデーションが通る' do
          user = FactoryBot.create(:user)
          theme = FactoryBot.create(:theme,user_id: user.id)
          idea =  FactoryBot.create(:idea,content:'aaa',user_id: user.id,theme_id: theme.id)
          expect(user).to be_valid
        end
      end
    end
end