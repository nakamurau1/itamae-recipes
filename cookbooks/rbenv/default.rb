HOME_DIR = "/home/ec2-user"
RBENV_DIR = "#{HOME_DIR}/.rbenv"
RBENV_PATH = "#{RBENV_DIR}/bin"

# execute 'yum update'

%w{git openssl-devel readline-devel sqlite-devel}.each do |pkg|
  package pkg
end
execute "yum groupinstall -y 'Development Tools'"

git RBENV_DIR do
  user "ec2-user"
  repository "git://github.com/sstephenson/rbenv.git"
end

git "#{RBENV_DIR}/plugins/ruby-build" do
  user "ec2-user"
  repository "git://github.com/sstephenson/ruby-build.git"
end

git "#{RBENV_DIR}/plugins/ruby-update" do
  user "ec2-user"
  repository "git://github.com/rkh/rbenv-update.git"
end

execute "#{RBENV_PATH}/rbenv install 2.6.6" do
  not_if "test -d #{RBENV_DIR}/versions/2.6.6"
  user "ec2-user"
end

execute "#{RBENV_PATH}/rbenv rehash" do
  user "ec2-user"
end

execute "#{RBENV_PATH}/rbenv global 2.6.6" do
  user "ec2-user"
end

execute "#{RBENV_PATH}/rbenv exec gem update --system" do
  user "ec2-user"
end

execute "#{RBENV_PATH}/rbenv exec gem install bundler:1.17.2" do
  user "ec2-user"
end
