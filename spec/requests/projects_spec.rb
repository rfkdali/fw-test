require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do
    it "returns ok" do
      get projects_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /projects' do
    let(:params) {{ name: 'test' }}
    it 'returns ok created' do
      post projects_path, params: { project: params }
      expect(response).to have_http_status(:created)
    end
  end
end
