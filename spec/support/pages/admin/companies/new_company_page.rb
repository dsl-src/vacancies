class AdminNewCompanyPage < SitePrism::Page
  set_url '/admin/companies/new'

  element :name, "input[name='company[name]']"
  element :link, "input[name='company[link]']"
  element :image, "input[name='company[picture_attributes][image]']"
  element :button_add, "input[value='ADD']"
end
