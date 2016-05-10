# Encoding: UTF-8
#
# Cookbook Name:: openvpn-plugin
# Library:: resource_openvpn_plugin
#
# Copyright 2016, Socrata, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource'

class Chef
  class Resource
    # A Chef resource for managing OpenVPN plugins.
    #
    # @author Jonathan Hartman <jonathan.hartman@socrata.com>
    class OpenvpnPlugin < Resource
      provides :openvpn_plugin, platform: 'ubuntu'

      default_action :install

      property :plugin_name,
               [String, Symbol],
               name_property: true,
               coerce: proc { |v| v.to_sym },
               equal_to: %i(duo okta)
      property :repo_name,
               String,
               default: lazy { "socrata-platform/#{plugin_name}-openvpn" }
      property :package_name,
               String,
               default: lazy { "#{plugin_name}-openvpn" }
      property :version,
               [String, nil],
               default: nil

      action :install do
        packagecloud_repo new_resource.repo_name
        package new_resource.package_name do
          version new_resource.version if new_resource.version
        end
      end

      action :upgrade do
        packagecloud_repo new_resource.repo_name
        package new_resource.package_name do
          version new_resource.version if new_resource.version
          action :upgrade
        end
      end

      action :remove do
        package new_resource.package_name do
          action :purge
        end
        file '/etc/apt/sources.list.d/' \
            "#{new_resource.repo_name.tr('/', '_')}.list" do
          action :delete
        end
      end

      action :enable do
        raise('Not yet implemented')
      end

      action :disable do
        raise('Not yet implemented')
      end
    end
  end
end
