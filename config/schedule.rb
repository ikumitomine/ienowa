# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, "development" # cronを実行する環境変数をセット
set :output, 'log/cron.log' # ログの出力先ファイルを指定
env :PATH, ENV['PATH']# 自分のアプリケーション直下でメソッドを動かすためにパスを指定
# job_type :coupon, 'cd :path && export PATH=/home/vagrant/work/ienowa:$PATH &&
#   :environment_variable=:environment bundle exec rake :task --silent :output'

every 1.day, at: '0:00 am' do
  runner 'Coupon.coupon_destroy'
end
