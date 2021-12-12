require 'rails_helper'

RSpec.describe 'Floorplans', type: :request do
  let(:project)   { create(:project) }
  let(:floorplan) { create(:floorplan, project_id: project.id) }

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
    let(:params) {{ name: 'test', main_image: fixture_file_upload('floorplan.jpg')}}

    it 'returns ok created' do
      post "/projects/#{project.id}/floorplans", params: { floorplan: params }
      expect(response).to have_http_status(:created)
    end

    context 'without project_id' do
      it 'returns error' do
        post "/projects/-/floorplans", params: { floorplan: params }
        expect(response).to have_http_status(422)
      end
    end
  end
end
