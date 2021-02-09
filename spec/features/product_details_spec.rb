require 'rails_helper'

RSpec.feature "Visitor navigate to home page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They visit the product page, and check if there are product details" do
    visit root_path
    save_screenshot("screenshot_2.png")
    expect(page).to have_text(/Details/i)
  end
  
  scenario "They pick a product, and it shows a specific product detail page" do
    visit root_path
    save_screenshot("screenshot_3a.png")
    click_link('Details', match: :first)
    sleep(1)  
    save_screenshot("screenshot_3b.png")
    page.find('.product-detail')    
  end
end
