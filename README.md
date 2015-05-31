A Gentoo Portage Overlay
------------------------

This is a package repository for [Gentoo Linux](http://gentoo.org) which
contains a few useful things.

It is in the official list of gentoo "overlay" package repositories, so all you need to do is

```sh
	layman -a timboudreau
```

In more detail:

 * You need to be running [Gentoo](http://gentoo.org) Linux or one of its derivatives such as [Funtoo](http://funtoo.org).
 * If you don't have layman installed already, run `emerge layman` (and make sure your `make.conf` sources '/var/lib/layman/make.conf'
 * Run `layman add timboudreau`
 * Run `eix-sync` to add it to your local package database (or `emerge --update` if you don't use `eix`)


Some of the software included here:

 * [syncthing](http://syncthing.org) - like dropbox, but between *your* machines - be your own personal cloud
 * [etcd](https://github.com/coreos/etcd) - a high-availability key/value thingy similar to
Zookeeper but hopefully less awful
 * [flatbuffers](http://google.github.io/flatbuffers/md__building.html) - Google's copy-free data 
serialization library for Java and C
 * [statsd](https://github.com/etsy/statsd/) - Etsy's statsd, a thing for collecting statistics and 
sending them to things that can graph them or do other useful things with them
 * Various fonts, mostly monospaced coding ones
   * specifically [monofur](http://www.dafont.com/monofur.font), which is my go-to
coding font, and
   * Adobe's lovely [Source Code Pro](http://blogs.adobe.com/typblography/2012/09/source-code-pro.html) font


