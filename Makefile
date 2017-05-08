setup:
	bundle install
	bundle exec berks install
	bundle exec berks vendor community-cookbooks

bootstrap:
	bundle exec knife zero bootstrap $(filter-out $@,$(MAKECMDGOALS)) --run-list 'role[meatspaces_chat]' --yes
