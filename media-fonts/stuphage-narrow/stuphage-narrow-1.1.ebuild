EAPI=7
inherit font

P="archive"
DESCRIPTION="A fixed width font designed for coding, narrow variant"
HOMEPAGE="https://timboudreau.com"

SRC_URI="https://timboudreau.com/files/stuphage-narrow-${PV}.zip"
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
	doins "${S}/stuphage-narrow/stuphage-narrow-medium.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-medium-italic.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-bold.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-bold-italic.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-thin.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-thin-italic.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-black.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-black-italic.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-verylight.ttf"
	doins "${S}/stuphage-narrow/stuphage-narrow-verylight-italic.ttf"
	font_xfont_config
	font_fontconfig
}
