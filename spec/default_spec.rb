#
# Author:: TANABE Ken-ichi (<nabeken@tknetworks.org>)
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
require 'spec_helper'

describe 'nagios::default' do
  include_context 'debian'

  let (:chef_run) {
    ChefSpec::SoloRunner.new() do |node|
      set_node(node)
    end
  }

  before do
    chef_run.converge(described_recipe)
  end

  it 'installs nagios package' do
    expect(chef_run).to install_package "nagios3"
  end

  it 'links apache config to sites-enabled' do
    expect(chef_run).to create_link("#{chef_run.node['apache']['dir']}/sites-enabled/nagios").
      with(to: "#{chef_run.node['nagios']['apache2_site']}")
  end

  it 'installs htpasswd.users' do
    expect(chef_run).to render_file("#{chef_run.node['nagios']['config_dir']}/htpasswd.users").
      with_content("nagiosadmin:#{chef_run.node['nagios']['nagiosadmin']}")
  end
end
