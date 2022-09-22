EAPI=7
inherit font

P="archive"
DESCRIPTION="A fixed width font designed for coding"
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
	insinto /usr/share/fonts/${PN}
	doins "${S}/${PN}/${PN}-Regular.ttf"
	doins "${S}/${PN}/${PN}-RegularItalic.ttf"
	doins "${S}/${PN}/${PN}-Bold.ttf"
	doins "${S}/${PN}/${PN}-BoldItalic.ttf"
	doins "${S}/${PN}/${PN}-Thin.ttf"
	doins "${S}/${PN}/${PN}-ThinItalic.ttf"
	doins "${S}/${PN}/${PN}-Black.ttf"
	doins "${S}/${PN}/${PN}-BlackItalic.ttf"
	doins "${S}/${PN}/${PN}-VeryLight.ttf"
	doins "${S}/${PN}/${PN}-VeryLightItalic.ttf"

	doins "${S}/${PN}/${PN}-Square-Regular.ttf"
	doins "${S}/${PN}/${PN}-Square-RegularItalic.ttf"
	doins "${S}/${PN}/${PN}-Square-Bold.ttf"
	doins "${S}/${PN}/${PN}-Square-BoldItalic.ttf"
	doins "${S}/${PN}/${PN}-Square-Thin.ttf"
	doins "${S}/${PN}/${PN}-Square-ThinItalic.ttf"
	doins "${S}/${PN}/${PN}-Square-Black.ttf"
	doins "${S}/${PN}/${PN}-Square-BlackItalic.ttf"
	doins "${S}/${PN}/${PN}-Square-VeryLight.ttf"
	doins "${S}/${PN}/${PN}-Square-VeryLightItalic.ttf"

	doins "${S}/${PN}/${PN}-Narrow-Regular.ttf"
	doins "${S}/${PN}/${PN}-Narrow-RegularItalic.ttf"
	doins "${S}/${PN}/${PN}-Narrow-Bold.ttf"
	doins "${S}/${PN}/${PN}-Narrow-BoldItalic.ttf"
	doins "${S}/${PN}/${PN}-Narrow-Thin.ttf"
	doins "${S}/${PN}/${PN}-Narrow-ThinItalic.ttf"
	doins "${S}/${PN}/${PN}-Narrow-Black.ttf"
	doins "${S}/${PN}/${PN}-Narrow-BlackItalic.ttf"
	doins "${S}/${PN}/${PN}-Narrow-VeryLight.ttf"
	doins "${S}/${PN}/${PN}-Narrow-VeryLightItalic.ttf"

	doins "${S}/${PN}/${PN}-Wide-Regular.ttf"
	doins "${S}/${PN}/${PN}-Wide-RegularItalic.ttf"
	doins "${S}/${PN}/${PN}-Wide-Bold.ttf"
	doins "${S}/${PN}/${PN}-Wide-BoldItalic.ttf"
	doins "${S}/${PN}/${PN}-Wide-Thin.ttf"
	doins "${S}/${PN}/${PN}-Wide-ThinItalic.ttf"
	doins "${S}/${PN}/${PN}-Wide-Black.ttf"
	doins "${S}/${PN}/${PN}-Wide-BlackItalic.ttf"
	doins "${S}/${PN}/${PN}-Wide-VeryLight.ttf"
	doins "${S}/${PN}/${PN}-Wide-VeryLightItalic.ttf"

	doins "${S}/${PN}/${PN}-Short-Regular.ttf"
	doins "${S}/${PN}/${PN}-Short-RegularItalic.ttf"
	doins "${S}/${PN}/${PN}-Short-Bold.ttf"
	doins "${S}/${PN}/${PN}-Short-BoldItalic.ttf"
	doins "${S}/${PN}/${PN}-Short-Thin.ttf"
	doins "${S}/${PN}/${PN}-Short-ThinItalic.ttf"
	doins "${S}/${PN}/${PN}-Short-Black.ttf"
	doins "${S}/${PN}/${PN}-Short-BlackItalic.ttf"
	doins "${S}/${PN}/${PN}-Short-VeryLight.ttf"
	doins "${S}/${PN}/${PN}-Short-VeryLightItalic.ttf"

	font_xfont_config
	font_fontconfig
}
