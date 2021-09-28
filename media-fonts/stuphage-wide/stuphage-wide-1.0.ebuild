EAPI=7
inherit font

P="archive"
DESCRIPTION="A fixed width font designed for coding, wide variant"
HOMEPAGE="https://timboudreau.com"

SRC_URI="https://timboudreau.com/files/${PN}-${PV}.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks mirror"
FONT_CONF=( "${FILESDIR}/62-stuphage.conf" )

S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"

src_unpack() {
	/usr/bin/unzip "${DISTDIR}/${A}" -d "${S}"
}

src_install() {
        echo "S is ${S}"
	insinto /usr/share/fonts/${PN}
	doins "${S}/${PN}/${PN}-medium.ttf"
	doins "${S}/${PN}/${PN}-medium-italic.ttf"
	doins "${S}/${PN}/${PN}-bold.ttf"
	doins "${S}/${PN}/${PN}-bold-italic.ttf"
	doins "${S}/${PN}/${PN}-thin.ttf"
	doins "${S}/${PN}/${PN}-thin-italic.ttf"
	doins "${S}/${PN}/${PN}-black.ttf"
	doins "${S}/${PN}/${PN}-black-italic.ttf"
	doins "${S}/${PN}/${PN}-verylight.ttf"
	doins "${S}/${PN}/${PN}-verylight-italic.ttf"
	font_xfont_config
	font_fontconfig
}

