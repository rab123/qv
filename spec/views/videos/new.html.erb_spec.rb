require 'spec_helper'

describe "videos/new.html.erb" do
  before(:each) do
    assign(:video, stub_model(Video,
      :title => "MyString",
      :description => "MyText",
      :category => "MyString",
      :subject => "MyString",
      :url => "MyString",
      :embed_code => "MyText",
      :age_level => 1,
      :rating => 1,
      :finder_id => 1
    ).as_new_record)
  end

  it "renders new video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path, :method => "post" do
      assert_select "input#video_title", :name => "video[title]"
      assert_select "textarea#video_description", :name => "video[description]"
      assert_select "input#video_category", :name => "video[category]"
      assert_select "input#video_subject", :name => "video[subject]"
      assert_select "input#video_url", :name => "video[url]"
      assert_select "textarea#video_embed_code", :name => "video[embed_code]"
      assert_select "input#video_age_level", :name => "video[age_level]"
      assert_select "input#video_rating", :name => "video[rating]"
      assert_select "input#video_finder_id", :name => "video[finder_id]"
    end
  end
end
