# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 multilib

MY_PN=synfig
DESCRIPTION="Synfig core engine and libraries"
HOMEPAGE="http://www.synfig.org/"
EGIT_REPO_URI="git://github.com/synfig/${MY_PN}.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dv ffmpeg fontconfig imagemagick jpeg openexr truetype"

DEPEND=">=dev-cpp/ETL-0.04.17
	dev-cpp/libxmlpp:2.6
	sci-libs/fftw:3.0
	dev-libs/libsigc++
	dv? ( media-libs/libdv )
	openexr? ( media-libs/openexr )
	truetype? ( media-libs/freetype )
	fontconfig? ( media-libs/fontconfig )
	ffmpeg? ( virtual/ffmpeg )
	jpeg? ( virtual/jpeg )
	imagemagick? ( media-gfx/imagemagick )"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_with dv libdv) \
		$(use_with ffmpeg) \
		$(use_with fontconfig) \
		$(use_with imagemagick) \
		$(use_with jpeg) \
		$(use_with openexr) \
		$(use_with truetype freetype)
}
