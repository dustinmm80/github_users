require 'json'
require 'open-uri'

usernames = []

if node['github_users']['organization']
    usernames = JSON.parse(
        open("https://api.github.com/orgs/#{node['github_users']['organization']}/public_members").read
    ).map{|u| u['login']}
elsif node['github_users']['users']
    usernames = node['github_users']['users']
end

log "Creating group #{node['github_users']['group_name']}"

group node['github_users']['group_name'] do
    gid node['github_users']['group_id']
    action :create
end

log "Creating users #{usernames}"
    
usernames.each do |username|
    public_keys = JSON.parse(
        open("https://api.github.com/users/#{username}/keys").read
    ).map{|k| k['key']}

    user username do
        comment "Github User #{username}"
        gid node['github_users']['group_name']
        home "/home/#{username}"
        shell "/bin/bash"
        system true
        supports :manage_home => true 

        action :create
    end

    directory "/home/#{username}/.ssh" do
        owner username
        group node['github_users']['group_name']
        mode "0700"
        action :create
    end

    template "/home/#{username}/.ssh/authorized_keys" do
        source "authorized_keys.erb"
        owner username
        group node['github_users']['group_name']
        mode "0600"
        variables(
            :public_keys => public_keys
        )
    end

    if node['github_users']['allow_sudo']
        node.default['authorization']['sudo']['include_sudoers_d'] = true

        sudo node['github_users']['group_name'] do
            group node['github_users']['group_name']
            nopasswd true
        end 
    end
end
