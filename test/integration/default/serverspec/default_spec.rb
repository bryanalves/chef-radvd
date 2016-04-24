require 'serverspec'

set :backend, :exec

describe 'Radvd' do
  it 'is running' do
    expect(process('radvd')).to be_running
  end
end
