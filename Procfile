web: bundle exec rails server -p $PORT
default_worker: bundle exec sidekiq -q default -C config/sidekiq.yml
release: rails db:migrate
