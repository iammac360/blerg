require 'rails_helper'

RSpec.describe Post, :type => :model do
  context "association" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
  end

  it_behaves_like "Sluggable" do
    let(:params) do
      {
        title: "This",
        content: "This is something interesting",
      }
    end
  end
end
