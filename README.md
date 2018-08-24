# Attendance

Speed up your Active Record query performance by not loading Active Record objects when calling `present?`. Inspired by [this tweet thread](https://twitter.com/nateberkopec/status/1032678576535957506).

## Wait? Why not Commit to Rails? You have Commit right?

While this change is astoundingly small (in code terms) it might not be a good fit for 100% of apps (see the caveats section). This was already [discussed](https://github.com/rails/rails/issues/29400) then [committed](https://github.com/rails/rails/pull/10539) and eventually removed from the Rails codebase.

If this gem has legs and lots of people like it then it's a good proxy for a test run of changing the default rails behavior. If everyone hates it, then no harm, remove the gem from your Gemfile.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attendance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attendance

## Usage

That's it. Now when you call `present?` on an `ActiveRecord::Relation` object it will not load it into memory:

Without attendance:

```
User.where(github: 'schneems').present?
  User Load (1.5ms)  SELECT "users".* FROM "users" WHERE "users"."github" = $1  [["github", "schneems"]]
=> true
```


With attendance:

```
User.where(github: 'schneems').present?
  User Exists (1.2ms)  SELECT  1 AS one FROM "users" WHERE "users"."github" = $1 LIMIT $2  [["github", "schneems"], ["LIMIT", 1]]
```

> Note: The SQL query only returns back true/false (SELECT 1) instead of the whole object.

## How does this Gem Work?

It monkeypatches `ActiveRecord::Relation` to alias `blank?` to `empty?`.

## Caveats

[We're not entirely sure if this is always a good idea or not, and it may cause extra queries](https://github.com/rails/rails/issues/29400#issuecomment-307782895).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schneems/attendance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Attendance project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/schneems/attendance/blob/master/CODE_OF_CONDUCT.md).
