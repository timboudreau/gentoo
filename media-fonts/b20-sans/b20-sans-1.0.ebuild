EAPI=3
inherit font

MY_PN="b20-sans"
P="archive"
DESCRIPTION="B20 Sans, a sans-serif font"
HOMEPAGE="http://www.dafont.com/b20-sans.font"

SRC_URI="http://img.dafont.com/dl/?f=b20_sans -> b20-sans-${PV}.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/67-b20-sans.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}

        cd "${WORKDIR}"
	doins *.ttf

	font_xfont_config
	font_fontconfig
}
