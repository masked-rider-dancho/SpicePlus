require 'rails_helper'

describe "areas/show" do
  before(:each) do
    @area = assign(:area, stub_model(Area,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
  end
end
