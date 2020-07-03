require 'rails_helper'

RSpec.describe Friend, type: :model do
    let(:friend) { create(:friend) }

    describe '有効性の検証' do
        it '有効なファクトリを持つこと' do
            expect(friend).to be_valid
        end
    end

    describe '存在性の検証' do
        it '名前がない場合、無効であること' do
            friend.name = ''
            expect(friend).not_to be_valid
        end
    end

    describe '文字数の検証' do
        it '名前が20文字以内の場合、有効であること' do
            friend.name = 'a' * 20
            expect(friend).to be_valid
        end
    
        it '名前が21文字以上の場合、無効であること' do
            friend.name = 'a' * 21
            expect(friend).not_to be_valid
        end
    end
end