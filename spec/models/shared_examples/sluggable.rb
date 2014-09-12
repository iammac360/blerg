shared_examples_for "Sluggable" do
  it "generates a slug based on the name of object" do
    created_obj = subject.class.create! params
    expect(created_obj).not_to be nil
    expect(created_obj.slug).not_to be_blank
  end
end
