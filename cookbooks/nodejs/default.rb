HOME_DIR = "/home/ec2-user"
NVM_DIR = "#{HOME_DIR}/.nvm"
NVM_PATH = "#{NVM_DIR}/bin"

# pumaに必要なnodejsのインストール
execute "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash"
execute "cd #{HOME_DIR}; . ~/.nvm/nvm.sh; nvm install node;" do
  user "ec2-user"
end
