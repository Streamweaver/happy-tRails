Overview
========

These are just some notes related to important features, gems or commands I
want to take particular note of.

Rake
----

Migration production, remember development is default env.
    >rake db:migrate RAILS_ENV=production


Rails
-----
Run server other than development
    >rails server --environment production

Annotate
--------

[Gem Page Link](https://rubygems.org/gems/annotate)

Gem Install: `gem 'annotate'`

**Rake Task for Migrating Tests** `rake db:test:prepare`

