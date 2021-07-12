EAPI=7
inherit font

MY_PN="bowman"
P="archive"
DESCRIPTION="Bowman, a monospaced font"
HOMEPAGE="http://www.dafont.com/bowman.font"

SRC_URI="http://img.dafont.com/dl/?f=bowman -> bowman-${PV}.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/70-bowman.conf" )
S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"

src_unpack() {
	/usr/bin/unzip "${DISTDIR}/${A}" -d "${S}"
}

src_install() {
	insinto /usr/share/fonts/${PN}

	doins "${S}/Bowman.ttf"
	font_xfont_config
	font_fontconfig
}
