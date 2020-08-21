execute "sudo amazon-linux-extras install nginx1.12 -y" do
  user "ec2-user"
end

template "/etc/nginx/nginx.conf" do
  source "../../files/nginx/rails_app.conf"
  owner "root"
  group "root"
  mode '644'
end

execute "sudo systemctl restart nginx"  do
  user "ec2-user"
end
