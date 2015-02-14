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
include_attribute 'apache2::default'

default['nagios']['package'] = 'nagios3'
default['nagios']['config_dir'] = '/etc/nagios3'
default['nagios']['apache2_site'] = "#{default['nagios']['config_dir']}/apache2.conf"

# default password is 'password' for nagiosadmin
default['nagios']['nagiosadmin'] = '{SHA}W6ph5Mm5Pz8GgiULbPgzG37mj9g='
