# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/nats-io"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A high Performance NATS Server written in GoLang (was:net-misc/gnatsd)"
HOMEPAGE="https://nats.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

pkg_postinst() {
	dosym /usr/bin/nats-server /usr/bin/gnatsd
}
