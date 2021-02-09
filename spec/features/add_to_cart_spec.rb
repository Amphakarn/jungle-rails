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

  scenario "They can click 'Add to Cart' buttons for one of the products" do
    visit root_path
    save_screenshot("screenshot_4a.png")
    click_on('Add', match: :first)
    sleep(1)  
    save_screenshot("screenshot_4b.png")
    expect(page).to have_content 'My Cart (1)'
  end
end
