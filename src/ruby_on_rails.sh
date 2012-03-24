
# install ruby
cd ~/
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar -zxvf ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290
./configure
make
sudo make install
cd ..
rm -rf ruby-1.9.2-p290/ ruby-1.9.2-p290.tar.gz

# install rubygems
cd ~/
wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
tar -zxvf rubygems-1.8.10.tgz
cd rubygems-1.8.10
sudo ruby setup.rb
cd ..
rm -rf rubygems-1.8.10/ rubygems-1.8.10.tgz

# isntall a bunch of gems
cd ~/
sudo gem install rails -v 3.1.0
sudo gem install rspec-rails -v 2.6.1
sudo gem install cucumber -v 1.0.6
sudo gem install nokogiri -v 1.5.0
sudo gem install capybara -v 1.1.1
sudo gem install rcov -v 0.9.10
sudo gem install haml -v 3.1.3
sudo gem install sqlite3 -v 1.3.4
sudo gem install uglifier -v 1.0.3
sudo gem install heroku -v 2.8.0
sudo gem install execjs
sudo gem install therubyracer
sudo gem install flog
sudo gem install flay
sudo gem install reek
sudo gem install rails_best_practices
# sudo gem install churn
# sudo gem install chronic -v=0.3.0
# sudo gem install metric_fu
sudo gem install bundler
sudo gem install haml
sudo gem install simplecov
sudo gem install factory_girl
sudo gem install ruby-tmdb
sudo gem install taps
sudo gem install thinking-sphinx
sudo gem install ruby-debug19

# install addional rails-related applications
cd ~/
sudo apt-get install -y sphinxsearch
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-server-dev-8.4
