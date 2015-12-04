require 'rails_helper'

RSpec.describe SearchVacanciesController, type: :controller do

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('vacancies/index')
    end
  end

end
