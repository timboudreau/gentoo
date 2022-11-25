# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/openni/openni-9999.ebuild,v 1.2 2011/10/31 09:16:53 frostwork Exp $

EAPI=7

inherit eutils git-r3 multilib

MY_PN="wav2png"
DESCRIPTION="Wav2png audio file thumbnailer"
HOMEPAGE="https://github.com/beschulz/${MY_PN}/"
EGIT_REPO_URI="https://github.com/beschulz/${MY_PN}.git"
EGIT_COMMIT="$PV"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

COMMON_DEPEND=">=dev-cpp/pngpp-0.2.9 >=media-libs/libsndfile-1.0.26 >=media-libs/libpng-1.2 >=dev-util/boost-build-1.7"

DEPEND=""

RDEPEND=${COMMON_DEPEND}

COMPDIR="${WORKDIR}/${PF}/build"
DOCS=${COMPDIR}/doc

INCLUDEPATH="/usr/include"

INSTALL_ROOT="${D}"

src_compile() {
	export PWD="${COMPDIR}/build"
	emake VERBOSE=1 -C ${COMPDIR} -w -f Makefile all
}

src_install() {
	dobin bin/Linux/wav2png
}
