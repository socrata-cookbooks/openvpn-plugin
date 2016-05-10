# Encoding: UTF-8

require_relative '../spec_helper'

describe 'openvpn-plugin::default::app' do
  %w(duo-openvpn okta-openvpn).each do |p|
    describe package(p) do
      it 'is installed' do
        expect(subject).to be_installed
      end
    end
  end
end
