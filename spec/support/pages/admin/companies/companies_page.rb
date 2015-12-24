class AdminCompaniesPage < SitePrism::Page
  set_url '/admin/companies'

  elements :companies_link, 'table tbody tr td:first a'
  element :button_new, '.new_company'
  elements :delete_buttons, 'table tbody tr td:last a'

  def click_company(title_company)
    link = companies_link.find { |title| title.text == title_company }
    link.click
  end
end
