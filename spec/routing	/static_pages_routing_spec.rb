require 'rails_helper'

RSpec.describe StaticPagesController, type: :routing do

it "layout links" do
	expect(get("help")).to route_to("static_pages#help")
    expect(get("about")).to route_to("static_pages#about")
  end

end