# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

repo_version = node['ernest']['library-versions']['authentication-middleware']
rev = repo_version.nil? ? 'develop' : repo_version

force_repo = node['ernest']['application']['repos']['authentication-middleware']

directory '/opt/ernest-libraries' do
  owner node['server']['user']
  group node['server']['group']
  mode '0755'
  action :create
end

git '/opt/ernest-libraries/authentication-middleware' do
  user node['server']['user']
  group node['server']['group']
  repository force_repo.nil? ? "git@github.com:#{node['ernest']['organization']}/authentication-middleware.git" : force_repo
  revision rev
  action :sync
end