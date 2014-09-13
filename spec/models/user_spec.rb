require 'rails_helper'

RSpec.describe User, :type => :model do
  context "association" do
    it { should have_many(:posts) }
  end

  context "validations" do
    it { should validate_presence_of(:email) }
    it { should_not allow_value('asdfasdf!@ q234', 'asdfasdf@asdfasdf.com!').for(:email) }
    it { should allow_value('test@test.com').for(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:username) }
    it { should ensure_length_of(:username).is_at_least(4)}
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }

    it { should ensure_length_of(:password).is_at_least(8) }
    it { should_not allow_value('asdfasdAasdfa', 'asdfasdfasdf').for(:password) }
    it { should allow_value('passWord123123', 'testtestTest1').for(:password) }
  end

  it_behaves_like "Sluggable" do
    let(:params) do
      {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        username: Faker::Name.first_name,
        password: "plassword1AA"
      }
    end
  end
end
