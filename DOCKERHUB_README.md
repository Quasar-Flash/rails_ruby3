# Quick reference

- **Maintained by**:
 [Danilo Carolino](https://github.com/danilogco/rails_ruby3)

## Supported tags and respective `Dockerfile` links

- [`1.0.0`, `latest`](https://github.com/danilogco/rails_ruby3/blob/master/Dockerfile)

## Quick reference (cont.)

- **Where to file issues**:
 [https://github.com/danilogco/rails_ruby3/issues](https://github.com/danilogco/rails_ruby3/issues)

## What is Ruby?

Ruby is a dynamic, reflective, object-oriented, general-purpose, open-source programming language. According to its authors, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.

> [wikipedia.org/wiki/Ruby_(programming_language)](https://en.wikipedia.org/wiki/Ruby_%28programming_language%29)

![logo](https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/ruby/logo.png)

## How to use this image

## Create a `Dockerfile` in your Ruby app project

```dockerfile
FROM danilogcarolino/rails_ruby3:1.0.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["./your-daemon-or-script.rb"]
```

Put this file in the root of your app, next to the `Gemfile`.

You can then build and run the Ruby image:

```console
docker build -t my-ruby-app .
docker run -it --name my-running-script my-ruby-app
```

### Generate a `Gemfile.lock`

The above example `Dockerfile` expects a `Gemfile.lock` in your app directory. This `docker run` will help you generate one. Run it in the root of your app, next to the `Gemfile`:

```console
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app danilogcarolino/rails_ruby3:1.0.0 bundle install
```

## Run a single Ruby script

For many simple, single file projects, you may find it inconvenient to write a complete `Dockerfile`. In such cases, you can run a Ruby script by using the Ruby Docker image directly:

```console
docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp danilogcarolino/rails_ruby3:1.0.0 ruby your-daemon-or-script.rb
```

## Encoding

By default, Ruby inherits the locale of the environment in which it is run. For most users running Ruby on their desktop systems, that means it's likely using some variation of `*.UTF-8` (`en_US.UTF-8`, etc). In Docker however, the default locale is `C`, which can have unexpected results. If your application needs to interact with UTF-8, it is recommended that you explicitly adjust the locale of your image/container via `-e LANG=C.UTF-8` or `ENV LANG C.UTF-8`.

## Image assumptions

This image sets several environment variables which change the behavior of Bundler and Gem for running a single application within a container (especially in such a way that the development sources of the application can be bind-mounted inside a container and not have `.bundle` from the host interfere with the proper functionality of the container).

The environment variables we set are canonically listed in the above-linked `Dockerfiles`, but some of them include `GEM_HOME`, `BUNDLE_PATH`, `BUNDLE_BIN`, `BUNDLE_SILENCE_ROOT_WARNING`, and `BUNDLE_APP_CONFIG`.

If these cause issues for your use case (running multiple Ruby applications in a single container, for example), setting them to the empty string *should* be sufficient for undoing their behavior.

## Image Variants

The `ruby` images come in many flavors, each designed for a specific use case.

## `danilogcarolino/rails_ruby3:<version>`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

Some of these tags may have names like bullseye or buster in them. These are the suite code names for releases of [Debian](https://wiki.debian.org/DebianReleases) and indicate which release the image is based on. If your image needs to install any additional packages beyond what comes with the image, you'll likely want to specify one of these explicitly to minimize breakage when there are new releases of Debian.

This tag is based off of [`buildpack-deps`](https://hub.docker.com/_/buildpack-deps/). `buildpack-deps` is designed for the average user of Docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.

## License

View [license information](https://www.ruby-lang.org/en/about/license.txt) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's `ruby/` directory](https://github.com/docker-library/repo-info/tree/master/repos/ruby).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
