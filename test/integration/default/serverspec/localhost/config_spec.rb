# Encoding: UTF-8

require_relative '../spec_helper'

describe 'openvpn-plugin::default::config' do
  describe file('/etc/openvpn/okta_openvpn.ini') do
    it 'exists' do
      expect(subject).to be_file
    end
  end
end
