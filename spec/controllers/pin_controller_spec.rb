require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  it "render index page" do
    get "index"
    expect(response).to render_template(:index)
  end
end
