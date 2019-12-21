EAPI=6
inherit font

MY_PN="SourceSansPro"
P="archive"
DESCRIPTION="Adobe's open source coding-adjacent font"
HOMEPAGE="https://adobe-fonts.github.io/source-sans-pro/"
SRC_URI="https://github.com/adobe-fonts/source-sans-pro/releases/download/2.045R-ro%2F1.095R-it/source-sans-pro-2.045R-ro-1.095R-it.zip"
LICENSE="Open Font License 1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd mips solaris ~amd64-linux ~x64-solaris"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/67-sourcesans.conf" )

S="${WORKDIR}/source-sans-pro-2.045R-ro-1.095R-it"
FONT_SUFFIX="ttf"

src_install() {
	insinto /usr/share/fonts/${PN}
	doins ${WORKDIR}/source-sans-pro-2.045R-ro-1.095R-it/TTF/*.ttf
	font_xfont_config
	font_fontconfig
}
