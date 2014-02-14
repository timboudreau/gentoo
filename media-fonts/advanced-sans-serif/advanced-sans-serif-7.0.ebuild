EAPI=3
inherit font

MY_PN="advanced-sans-serif"
P="archive"
DESCRIPTION="Advanced Sans Serif, a sans-serif font"
HOMEPAGE="http://www.dafont.com/advanced-sans-serif-7.font"

SRC_URI="http://img.dafont.com/dl/?f=advanced_sans_serif_7 -> advanced-sans-serif-${PV}.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/68-advanced-sans-serif.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}

        cd "${WORKDIR}"
	doins *.ttf

	font_xfont_config
	font_fontconfig
}
