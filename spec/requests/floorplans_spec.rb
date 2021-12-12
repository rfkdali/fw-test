require 'rails_helper'

RSpec.describe 'Floorplans', type: :request do
  let(:project)   { create(:project) }
  let(:floorplan_file) { fixture_file_upload('floorplan.jpg') }
  let(:floorplan) { create(:floorplan, project_id: project.id, main_image: floorplan_file) }

  describe 'GET /floorplans' do
    it 'returns ok' do
      get project_floorplans_path(project_id: project.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /floorplan' do
    let(:params) {{ id: floorplan.id, project_id: project.id }}
    it 'returns ok' do
      get project_floorplan_path(params)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /floorplans' do
    let(:params) {{ name: 'test', main_image: floorplan_file}}

    it 'returns ok created' do
      expect {
        post "/projects/#{project.id}/floorplans", params: { floorplan: params }
      }.to change {
        Floorplan.count
      }.by(1)

      expect(response).to have_http_status(:created)
      expect(json_body.keys).to contain_exactly(:name, :original, :thumb, :large)
    end

    context 'without project_id' do
      it 'returns error' do
        post "/projects/-/floorplans", params: { floorplan: params }
        expect(response).to have_http_status(422)
      end
    end
  end

  def json_body
    JSON.parse(response.body, symbolize_names: true)
  end
end
