require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full_name - sobrescrevendo name' do
    customer = create(:customer, name: 'Marcelo Campanelli')
    expect(customer.full_name).to start_with('Sr. Marcelo Campanelli')
  end

  it 'be a vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to eql(true)
  end

  it 'be a vip' do
    customer = create(:customer_default)
    expect(customer.vip).to eql(false)
  end

  it 'attrs transient' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eql(customer.name)
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'customer female default' do
    customer = create(:customer_female_default)
    expect(customer.vip).to eql(false)
    expect(customer.gender).to eql('F')
  end

  it 'customer female vip' do
    customer = create(:customer_female_vip)
    expect(customer.vip).to eql(true)
    expect(customer.gender).to eql('F')
  end

  it 'customer male' do
    customer = create(:customer_male)
    expect(customer.gender).to eql('M')
  end
end
