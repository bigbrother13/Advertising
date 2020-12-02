require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  it "render index page for html format" do
    get "index", format: :html
    expect(response).to render_template(:index)
  end
end
