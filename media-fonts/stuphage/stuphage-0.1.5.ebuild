EAPI=7
inherit font

MY_PN="stuphage"
P="archive"
DESCRIPTION="A fixed width font designed for coding"
HOMEPAGE="https://timboudreau.com"

SRC_URI="https://timboudreau.com/files/stuphage-${PV}.zip"
# SRC_URI="https://timboudreau.com/files/stuphage-0.1.zip -> stuphage-${PV}.zip"
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
	doins "${S}/stuphage/stuphage-medium.ttf"
	doins "${S}/stuphage/stuphage-medium-italic.ttf"
	doins "${S}/stuphage/stuphage-bold.ttf"
	doins "${S}/stuphage/stuphage-bold-italic.ttf"
	doins "${S}/stuphage/stuphage-thin.ttf"
	doins "${S}/stuphage/stuphage-thin-italic.ttf"
	doins "${S}/stuphage/stuphage-black.ttf"
	doins "${S}/stuphage/stuphage-black-italic.ttf"
	font_xfont_config
	font_fontconfig
}

