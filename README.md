Openvpn Plugin Cookbook
=======================
[![Cookbook Version](https://img.shields.io/cookbook/v/openvpn-plugin.svg)][cookbook]
[![Build Status](https://img.shields.io/travis/socrata-cookbooks/openvpn-plugin.svg)][travis]
[![Code Climate](https://img.shields.io/codeclimate/github/socrata-cookbooks/openvpn-plugin.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/socrata-cookbooks/openvpn-plugin.svg)][coveralls]

[cookbook]: https://supermarket.chef.io/cookbooks/openvpn-plugin
[travis]: https://travis-ci.org/socrata-cookbooks/openvpn-plugin
[codeclimate]: https://codeclimate.com/github/socrata-cookbooks/openvpn-plugin
[coveralls]: https://coveralls.io/r/socrata-cookbooks/openvpn-plugin

A Chef cookbook for managing OpenVPN server plugins.

Requirements
============

This cookbook does ***not*** install OpenVPN. Doing that is up to you and/or
the [openvpn](https://supermarket.chef.io/cookbooks/openvpn) cookbook.

It uses custom resources which require either Chef >= 12.5 or Chef 12.x and the
[compat_resource](https://supermarket.chef.io/cookbooks/compat_resource)
cookbook.

Usage
=====

Make use of the included custom resources in recipes or resources of your own.

Recipes
=======

N/A

Attributes
==========

N/A

Resources
=========

***openvpn_plugin***

A custom resource for managing OpenVPN plugins. It currently supports two
plugins--duo and okta.

Syntax:

    openvpn_plugin 'duo' do
      plugin_name 'duo'
      repo_name 'packagecloud-user/repo'
      package_name 'duo-openvpn' 
      action :install
    end

Actions:

| Action     | Description        |
|------------|--------------------|
| `:install` | Install the plugin |
| `:upgrade` | Upgrade the plugin |
| `:remove`  | Remove the plugin  | 

Attributes:

| Attribute    | Default         | Description            |
|--------------|-----------------|------------------------|
| plugin_name  | Resource name   | Name of the plugin     |
| repo_name    | Based on plugin | PackageCloud repo name |
| package_name | Based on plugin | Package name           |
| version      | `nil`           | Version to install     |
| action       | `:install`      | Action(s) to perform   |

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for the new feature; ensure they pass (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

License & Authors
=================
- Author: Jonathan Hartman <jonathan.hartman@socrata.com>

Copyright 2016, Socrata, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
