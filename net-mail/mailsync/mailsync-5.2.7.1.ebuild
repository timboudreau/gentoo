# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A mailbox synchronizer"
HOMEPAGE="http://mailsync.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}.orig.tar.gz"
SRC_URI="https://versaweb.dl.sourceforge.net/project/mailsync/mailsync/5.2.7/mailsync_5.2.7-1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"

IUSE=""

DEPEND="virtual/imap-c-client"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/mailsync ${WORKDIR}/mailsync-${PV}
	echo "Run autogen.sh"
	cd ${WORKDIR}/mailsync-${PV} && ./autogen.sh
}

src_install() {
	make DESTDIR=${D} install pkgdocdir=/usr/share/doc/${P} || die
	doman doc/mailsync.1
}
