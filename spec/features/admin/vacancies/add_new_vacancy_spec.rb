require 'rails_helper'

RSpec.feature 'Add new vacancy', type: :feature do
  let!(:user) { create :user }
  let!(:company) { create :company, creator_id: user.id }
  let!(:vacancy_data) { attributes_for :vacancy, company_id: company.id }
  let(:add_new_vacancy_page) { AdminNewVacancyPage.new }

  before do
    login_as user
    add_new_vacancy_page.load
  end

  scenario 'when filled with all the data' do
    add_new_vacancy_page.company.set vacancy_data[:company_id]
    add_new_vacancy_page.country.set vacancy_data[:country]
    add_new_vacancy_page.city.set vacancy_data[:city]
    add_new_vacancy_page.title.set vacancy_data[:title]
    add_new_vacancy_page.description.set vacancy_data[:description]
    add_new_vacancy_page.deadline_year.set vacancy_data[:deadline].year.to_s
    add_new_vacancy_page.deadline_month.set vacancy_data[:deadline].month.to_s
    add_new_vacancy_page.deadline_day.set vacancy_data[:deadline].day.to_s
    add_new_vacancy_page.button_add.click
    expect(AdminVacancyPage.new).to be_displayed
  end

  scenario 'when do not fill in the title vacancy' do
    add_new_vacancy_page.company.set vacancy_data[:company_id]
    add_new_vacancy_page.country.set vacancy_data[:country]
    add_new_vacancy_page.city.set vacancy_data[:city]
    add_new_vacancy_page.description.set vacancy_data[:description]
    add_new_vacancy_page.deadline_year.set vacancy_data[:deadline].year.to_s
    add_new_vacancy_page.deadline_month.set vacancy_data[:deadline].month.to_s
    add_new_vacancy_page.deadline_day.set vacancy_data[:deadline].day.to_s
    add_new_vacancy_page.button_add.click
    expect(add_new_vacancy_page).to have_content("Title can't be blank")
  end

  scenario 'when do not fill in the desc vacancy' do
    add_new_vacancy_page.company.set vacancy_data[:company_id]
    add_new_vacancy_page.country.set vacancy_data[:country]
    add_new_vacancy_page.city.set vacancy_data[:city]
    add_new_vacancy_page.title.set vacancy_data[:title]
    add_new_vacancy_page.deadline_year.set vacancy_data[:deadline].year.to_s
    add_new_vacancy_page.deadline_month.set vacancy_data[:deadline].month.to_s
    add_new_vacancy_page.deadline_day.set vacancy_data[:deadline].day.to_s
    add_new_vacancy_page.button_add.click
    expect(add_new_vacancy_page).to have_content("Description can't be blank")
  end
end