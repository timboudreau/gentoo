# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/syncthing"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A dropbox-like file synchronization tool"
HOMEPAGE="https://syncthing.net"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

pkg_postinst() {
        ebegin "Creating /etc/init.d/syncthing"
        newinitd "${FILESDIR}"/syncthing.initd-openrc-run syncthing
        newconfd "${FILESDIR}"/syncthing.conf syncthing
        eend ${?}
}


