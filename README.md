A Gentoo Portage Overlay
------------------------

This is a package repository for [Gentoo Linux](http://gentoo.org) which
contains a few things I've found useful.  It is not currently in the official list of gentoo 
"overlay" package repositories.  The easy way to use it:

 * If you don't have layman installed already, run `emerge layman` (and make sure your `make.conf` sources '/var/lib/layman/make.conf'
 * Edit your `/etc/layman/layman.cfg` and add `http://timboudreau.com/files/repositories.xml` to the `overlays:` list
 * Run `layman -a timboudreau` and if you use `eix` to search for packages, run `eix-update`
 * Now you can search for packages and the ones here will be included

Some of the software included here:

 * [flatbuffers](http://google.github.io/flatbuffers/md__building.html) - Google's copy-free data 
serialization library for Java and C
 * [etcd](https://github.com/coreos/etcd) - a high-availability key/value thingy similar to
Zookeeper but hopefully less awful
 * [statsd](https://github.com/etsy/statsd/) - Etsy's statsd, a thing for collecting statistics and 
sending them to things that can graph them or do other useful things with them
 * a bunch of fonts
   * specifically [monofur](http://www.dafont.com/monofur.font), which is my go-to
coding font, and
   * Adobe's lovely [Source Code Pro](http://blogs.adobe.com/typblography/2012/09/source-code-pro.html) font

I'll try to get this listed on the [official overlay list](http://gpo.zugaina.org/Overlays) soon.

