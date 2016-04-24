require 'spec_helper'

describe 'radvd::default' do
  context 'no providers' do
    let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

    it 'should install the package' do
      expect(chef_run).to install_package('radvd')
    end

    it 'should have a reasonable config file' do
      expect(chef_run).to render_file('/etc/radvd.conf').with_content(/eth0/)
    end
  end

  context 'with a prefix' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['radvd']['interface_options'] = {
        interface_opt: 'pass'
      }
      runner.node.set['radvd']['prefixes'] = {
        '2001:PASS' => {
          prefix_opt: 'pass'
        }
      }
      runner.converge(described_recipe)
    end

    it 'should have the provider in the config' do
      expect(chef_run).to render_file('/etc/radvd.conf').with_content(/interface_opt pass/)
      expect(chef_run).to render_file('/etc/radvd.conf').with_content(/2001:PASS/)
      expect(chef_run).to render_file('/etc/radvd.conf').with_content(/prefix_opt pass/)
    end
  end
end
