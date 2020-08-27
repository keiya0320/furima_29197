require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに一意性がないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていれば登録できる" do
      @user.email = "aaa@aaa"
      expect(@user).to be_valid
    end
    it "emailに@が含まれていなければ登録できない" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合であれば登録できる" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end
    it "passwordが半角英数字以外だと登録できない" do
      @user.password = "１１１１１１"
      @user.password_confirmation = "１１１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない" do
      @user.family_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "read_familyが空だと登録できない" do
      @user.read_family = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Read family is invalid")
    end
    it "read_firstが空だと登録できない" do
      @user.read_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Read first is invalid")
    end
    it "read_familyは全角(カタカナ)でないと登録できない" do
      @user.read_family = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Read family is invalid")
    end
    it "read_firstは全角(カタカナ)でないと登録できない" do
      @user.read_first = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Read first is invalid")
    end
    it "birthが空だと登録できない" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
