# Ruby 3.x Docker Image

Versions available:

| Ruby  | Branch | Latest release |
|-------|--------|----------------|
| 3.1.2 |  [Link](https://github.com/Quasar-Flash/rails_ruby3/tree/ruby_3.1)  |     [Link](https://github.com/Quasar-Flash/rails_ruby3/releases/tag/v1.2.0-ruby3.1)       |
| 3.0.3 |  [Link](https://github.com/Quasar-Flash/rails_ruby3/tree/ruby_3.0.3)  |     [Link](https://github.com/Quasar-Flash/rails_ruby3/releases/tag/v1.0.0)       |

## How to use it

Using ```docker-composer```:

```bash
docker-compose run --rm irb
```

Using only docker:

```bash
docker build -t ruby3 .
docker container run -it ruby3
```

## Problems

**Please do not directly email any committers with questions or problems.**  A community is best served when discussions are held in public.

Searching the [issues](https://github.com/danilogco/rails_ruby3/issues) for your problem is also a good idea.

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet;
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it;
* Fork the project;
* Start a feature/bugfix branch;
* Commit and push until you are happy with your contribution;
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.;
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

Please see [LICENSE](https://github.com/danilogco/rails_ruby3/blob/master/LICENSE.md) for licensing details.

## Maintainers

Danilo Carolino, [@danilogco](https://github.com/danilogco)
