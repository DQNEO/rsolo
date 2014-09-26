# rsolo

rsolo is a simple, zero-dependent tool which runs chef-solo on remote hosts.

## Usage

```
rsolo SUBCOMMAND [OPTIONS] ARGS
```

### rsolo prepare

install Chef on the remote host by the omnibus installer.

### rsolo cook

upload kitchen(a.ka. chef-repo) to the remote host and run `sudo chef-solo` over there.

### rsolo bootstrap

just `rsolo prepare` + `rsolo cook`


## rsolo VS. knife-solo

knife-solo is a great tool, but it requires `ruby`, `gem`, and `knife`

rsolo is a zero dependency tool. It's just a BASH script.

## Requirements

Bash version 3.2 or later

## Installation

```shell
curl -sO https://raw.githubusercontent.com/DQNEO/rsolo/master/rsolo
chmod  0755 ./rsolo
# if you would like to install globally
sudo mv rsolo /usr/local/bin/
```
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

## License

GPL v3

## Author

@DQNEO

