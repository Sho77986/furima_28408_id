require 'rails_helper'

#RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

describe User do
    before do
      @user = FactoryBot.bulid(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nicknameとemail、passwordとpassword_confirmation、
        first_nameとfamily_name、first_name_furiganaとfamily_name_furigana
        birthdayが存在すれば登録できる" do
         except(@user).to be_valid 
        end

        it "nicknameが40文字以下で登録できる" do
          @user.nickname ="abc"
          except(@user).to be_valid
        end
        it "passwordが6文字以上の英数字であれば登録できる" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          except(@user).to be_valid
        end


      end
  
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "nicknameが40文字以上であれば登録できない" do
          @user.nickname = "aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnn"
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
        end
        it "emailが空では登録できない" do
          @user.email =""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "abc12"
          @user.password_confirmation = "abc12"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errorfull_messages).to include("First_name can't be blank")
        end
        it "family_nameが空では登録できない" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family_name can't be blank")
        end
        it "first_name_furiganaが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First_name_furigana can't be blank")
        end
        it "family_name_furiganaが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family_name_furigana can't be blank")
        end
        it "birthdayが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
   end
end
