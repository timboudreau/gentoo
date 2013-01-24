EAPI=3
inherit font

MY_PN="eurofurence"
P="archive"
DESCRIPTION="S.A.X. mono, a monospaced font"
HOMEPAGE="http://www.dafont.com/saxmono.font"

SRC_URI="http://img.dafont.com/dl/?f=saxmono -> saxmono.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/63-saxmono.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}
	doins saxmono.ttf

	font_xfont_config
	font_fontconfig
}
