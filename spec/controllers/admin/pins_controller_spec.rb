require 'rails_helper'

RSpec.describe Admin::PinsController, type: :controller do
  it "render new page" do
    get "new"
    expect(response).to render_template(:new)
  end
end
