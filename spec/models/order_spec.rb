require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'have one order' do
    order = create(:order)
    p order.description
    p order.customer
    p order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end
end
