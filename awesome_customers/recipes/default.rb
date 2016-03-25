#
# Cookbook Name:: awesome_customers
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group 'bawarchi'
user 'bawarchi' do
 home '/home/bawarchi'
 group 'bawarchi'
 shell '/bin/bash'
end

package 'httpd' do
 action :install
end
service 'httpd' do
 action [:enable, :start]
end

file '/var/www/html/index.html' do
 content '<html>
 <body>
 <h1>Food is ready!!!</h1>
 </body>
 </html>'
 end
service 'iptables' do
 action :stop
end

directory '/var/www/html/bawarchi/' do
 owner 'bawarchi'
 group 'bawarchi'
 mode '0755'
 action :create
end
directory '/var/www/html/bawarchi/meals' do
 owner 'bawarchi'
 group 'bawarchi'
 mode '0755'
 action :create
end
directory '/var/www/html//bawarchi/tiffins' do
 owner 'bawarchi'
 group 'bawarchi'
 mode '0755'
 action :create
end
remote_file '/var/www/html/bawarchi/meals/biryani' do
 source 'https://s3-us-west-1.amazonaws.com/ashishbucket/Meals/Biryani'
 owner 'bawarchi'
 group 'bawarchi'
 mode '0755'
 action :create
end
remote_file '/var/www/html/bawarchi/tiffins/dosa' do
 source 'https://s3-us-west-1.amazonaws.com/ashishbucket/Tiffins/Dosa'
 owner 'bawarchi'
 group 'bawarchi'
 mode '0755'
 action :create
end
