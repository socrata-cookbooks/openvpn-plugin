require_relative '../../../spec_helper'

describe 'resource_openvpn_plugin::ubuntu::14_04' do
  %i(name plugin_name repo_name package_name version action).each do |p|
    let(p) { nil }
  end
  let(:runner) do
    ChefSpec::SoloRunner.new(
      step_into: 'openvpn_plugin', platform: 'ubuntu', version: '14.04'
    ) do |node|
      %i(name plugin_name repo_name package_name version action).each do |p|
        unless send(p).nil?
          node.set['resource_openvpn_plugin_test'][p] = send(p)
        end
      end
    end
  end
  let(:converge) { runner.converge('resource_openvpn_plugin_test') }

  context 'the default action (:install)' do
    let(:action) { nil }

    shared_examples_for 'any property set' do
      it 'configures the PackageCloud repo' do
        expected = if repo_name
                     repo_name
                   elsif plugin_name
                     "socrata-platform/#{plugin_name}-openvpn"
                   else
                     "socrata-platform/#{name}-openvpn"
                   end
        expect(chef_run).to create_packagecloud_repo(expected)
      end

      it 'installs the plugin package' do
        expected = if package_name
                     package_name
                   elsif plugin_name
                     "#{plugin_name}-openvpn"
                   else
                     "#{name}-openvpn"
                   end
        expect(chef_run).to install_package(expected).with(version: version)
      end
    end

    context 'the duo plugin' do
      let(:name) { 'duo' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'okta',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end

    context 'the okta plugin' do
      let(:name) { 'okta' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'duo',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end
  end

  context 'the :upgrade action' do
    let(:action) { :upgrade }

    shared_examples_for 'any property set' do
      it 'configures the PackageCloud repo' do
        expected = if repo_name
                     repo_name
                   elsif plugin_name
                     "socrata-platform/#{plugin_name}-openvpn"
                   else
                     "socrata-platform/#{name}-openvpn"
                   end
        expect(chef_run).to create_packagecloud_repo(expected)
      end

      it 'upgrades the plugin package' do
        expected = if package_name
                     package_name
                   elsif plugin_name
                     "#{plugin_name}-openvpn"
                   else
                     "#{name}-openvpn"
                   end
        expect(chef_run).to upgrade_package(expected).with(version: version)
      end
    end

    context 'the duo plugin' do
      let(:name) { 'duo' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'okta',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end

    context 'the okta plugin' do
      let(:name) { 'okta' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'duo',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end
  end

  context 'the :remove action' do
    let(:action) { :remove }

    shared_examples_for 'any property set' do
      it 'removes the plugin package' do
        expected = if package_name
                     package_name
                   elsif plugin_name
                     "#{plugin_name}-openvpn"
                   else
                     "#{name}-openvpn"
                   end
        expect(chef_run).to purge_package(expected)
      end

      it 'removes the PackageCloud repo' do
        expected = if repo_name
                     "#{repo_name.tr('/', '_')}.list"
                   elsif plugin_name
                     "socrata-platform_#{plugin_name}-openvpn.list"
                   else
                     "socrata-platform_#{name}-openvpn.list"
                   end
        expect(chef_run).to delete_file("/etc/apt/sources.list.d/#{expected}")
      end
    end

    context 'the duo plugin' do
      let(:name) { 'duo' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'okta',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end

    context 'the okta plugin' do
      let(:name) { 'okta' }

      context 'all default properties' do
        cached(:chef_run) { converge }

        it_behaves_like 'any property set'
      end

      {
        plugin_name: 'duo',
        repo_name: 'pants',
        package_name: 'test',
        version: '1.2.3'
      }.each do |prop, val|
        context "an overridden #{prop}" do
          let(prop) { val }
          cached(:chef_run) { converge }

          it_behaves_like 'any property set'
        end
      end
    end
  end

  context 'the :enable action' do
    let(:action) { :enable }

    it 'is TBD' do
      pending
      expect { chef_run }.to_not raise_error
    end
  end

  context 'the :disable action' do
    let(:action) { :disable }

    it 'is TBD' do
      pending
      expect { chef_run }.to_not raise_error
    end
  end
end
