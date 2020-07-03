require 'rails_helper'

RSpec.describe FriendsDetail, type: :model do
    let(:friends_detail) { create(:friends_detail) }

    describe '有効性の検証' do
        it '有効なファクトリを持つこと' do
            expect(friends_detail).to be_valid
        end
    end

    describe '存在性の検証' do
        it 'featureがない場合、無効であること' do
            friends_detail.feature = ''
            expect(friends_detail).not_to be_valid
        end

        it 'contentがない場合、無効であること' do
            friends_detail.content = ''
            expect(friends_detail).not_to be_valid
        end
    end

    describe '文字数の検証' do
        it 'featureが20文字以内の場合、有効であること' do
            friends_detail.feature = 'a' * 20
            expect(friends_detail).to be_valid
        end
    
        it 'featureが21文字以上の場合、無効であること' do
            friends_detail.feature = 'a' * 21
            expect(friends_detail).not_to be_valid
        end

        it 'contentが140文字以内の場合、有効であること' do
            friends_detail.content = 'a' * 140
            expect(friends_detail).to be_valid
        end
    
        it 'contentが141文字以上の場合、無効であること' do
            friends_detail.content = 'a' * 141
            expect(friends_detail).not_to be_valid
        end
    end
end