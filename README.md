# rsolo

rsolo is a simple tool which runs `chef-solo` on a remote host.

## DESCRIPTION

it can do:

* install chef on remote host
* run chef-solo on remote host

rsolo is a shell-script version of `knife-solo`.

## Usage

```
# At first , install Chef on the remote host
$ rsolo prepare user@remote

# Second, run chef-solo
$ rsolo cook user@remote
```

### rsolo prepare

install Chef on the remote host by [the omnibus installer](https://docs.getchef.com/install_omnibus.html).

### rsolo cook

upload kitchen(in other words, chef-repo) to a remote host and run `sudo chef-solo` over there.

### rsolo revendor

just do the same thing as below when you have installed Berkshelf

```shell
$ rm -rf cookbooks Berksfile.lock
$ berks vendor cookbooks
```

### rsolo helloworld

This is a very unique feature.

It creates a cookbook name `helloworld` , and do `prepare` + `cook -o helloworld` it automatically.

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

## Installation

```shell
$ curl -sO https://raw.githubusercontent.com/DQNEO/rsolo/master/rsolo
$ chmod  0755 ./rsolo
# if you would like to install globally
$ sudo mv rsolo /usr/local/bin/
```


## Requirements

Bash version 3.2 or later

## rsolo VS. knife-solo

gem `knife-solo` is a great tool, but I don't want to care about ruby tools like gem, bunlder.

rsolo is a zero dependency tool. It's just a BASH script.

besides, `knife-solo` has too complicated options.
I am tired of doing lik this:

```shell
$ knife solo cook --no-berkshelf --no-chef-check -F tmpconfig hostname nodes/hostname.json
```

In `rsolo`, you can do this:

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

