# rsolo

rsolo is a simple tool which runs `chef-solo` on a remote host.

## DESCRIPTION

it can do:

* install chef on remote host
* run chef-solo on remote host

rsolo is a shell-script version of `knife-solo`.

## Usage

```
$ rsolo prepare user@remote
$ rsolo cook user@remote
```

### rsolo prepare

install Chef on the remote host by [the omnibus installer](https://docs.getchef.com/install_omnibus.html).

### rsolo cook

upload kitchen(in other words, chef-repo) to a remote host and run `sudo chef-solo` over there.

## Example

```
# At first , install Chef on the remote host
$ rsolo prepare user@hostname
# Second, run chef-solo
$ rsolo cook user@hostname
```

## Coordination with Vagrant (experimental)

If You has a node json file `nodes/vagrant.json`, you can just do

```
$ rsolo prepare --vagrant
$ rsolo cook --vagrant
```

Or if you want to use another json file (e.g. nodes/foo.json )

```
$ rsolo prepare --vagrant -N foo
$ rsolo cook --vagrant -N foo
```



## rsolo VS. knife-solo

knife-solo is a great tool, but it requires `ruby`, `gem`, and `knife`

rsolo is a zero dependency tool. It's just a BASH script.

## Requirements

Bash version 3.2 or later

## Installation

```shell
$ curl -sO https://raw.githubusercontent.com/DQNEO/rsolo/master/rsolo
$ chmod  0755 ./rsolo
# if you would like to install globally
$ sudo mv rsolo /usr/local/bin/
```
## Motivation

gem `knife-solo` is a great tool, but I don't want to care about ruby tools like gem, bunlder.

besides, `knife-solo` has too complicated options.
I am tired of doing lik this:

```shell
$ knife solo cook --no-berkshelf --no-chef-check --ssh-config-file tmpconfig tmphost nodes/${last_argument}.json
```

Instead, I'd like to do this:

```shell
$ rsolo cook -F tmpconfig -N nodename hostname
```

## License

GPL v3

## Author

@DQNEO

## TODO

* option
 * -o
 * --format
* help for subcommands

