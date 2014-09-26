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

## Example

```
# At first , install Chef on the remote host
rsolo prepare user@hostname
# Second, run chef-solo
rsolo cook user@hostname
```

## Coordination with Vagrant

If You has a node json file `nodes/vagrant.json`, you can just do

```
rsolo prepare --vagrant
rsolo cook --vagrant
```

Or if you want to use other json file (e.g. nodes/foo.json )

```
rsolo prepare --vagrant -N foo
rsolo cook --vagrant -N foo
```



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

