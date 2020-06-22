require 'rails_helper'

RSpec.describe User, type: :model do

    before do
        @user = build(:user)
    end

    describe '存在性の検証' do
        it '名前がない場合、無効であること' do
            @user.name = ' '
            expect(@user).not_to be_valid
        end
    
        it 'メールアドレスがない場合、無効であること' do
            @user.email = ' '
            expect(@user).not_to be_valid
        end
    end
end