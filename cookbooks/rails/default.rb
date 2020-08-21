HOME_DIR = "/home/ec2-user"
RBENV_DIR = "#{HOME_DIR}/.rbenv"
RBENV_PATH = "#{RBENV_DIR}/bin"

git "#{HOME_DIR}/itamae-sample" do
  user "ec2-user"
  repository "git://github.com/nakamurau1/itamae-sample.git"
end

execute "export RAILS_MASTER_KEY=51e9c389e374b5e90cd353e6e450bbd3" do
  user "ec2-user"
end

execute "cd #{HOME_DIR}/itamae-sample; #{RBENV_PATH}/rbenv exec bundle exec unicorn_rails -c config/unicorn.rb -E development -D" do
  not_if "test -f /tmp/unicorn.pid"
  user "ec2-user"
end