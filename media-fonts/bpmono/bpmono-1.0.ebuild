EAPI=3
inherit font

MY_PN="bp-mono"
P="archive"
DESCRIPTION="BP Mono, a monospaced font"
HOMEPAGE="http://www.dafont.com/bpmono.font"

SRC_URI="http://img.dafont.com/dl/?f=bpmono -> bp-mono-${PV}.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/69-bp-mono.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}

        cd "${WORKDIR}"
	doins *.ttf

	font_xfont_config
	font_fontconfig
}
