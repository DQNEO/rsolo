# rsolo

implementation of `knife-solo` by bash.

## Usage

rsolo cook

### rsolo cook

rsolo cook does only 2 things.

* rsync kitchen(a.ka. chef-repo)
* run chef-solo on remote host


## Motivation

gem `knife-solo` is a great tool, but I don't want to care about ruby tools like gem, bunlder.

besides, `knife-solo` has too complicated options.
I am tired of doing lik this:

```shell
knife solo cook --no-berkshelf --no-chef-check --ssh-config-file tmpconfig tmphost nodes/${last_argument}.json
```

Instead, I'd like to do this:

```shell
bashsolo cook -F tmpconfig -N nodename hostname
```


