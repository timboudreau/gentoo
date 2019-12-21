EAPI=6
inherit font

MY_PN="SourceCodePro"
P="archive"
DESCRIPTION="Adobe's open source coding font"
HOMEPAGE="https://adobe-fonts.github.io/source-code-pro/"
SRC_URI="https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip"
LICENSE="OFL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd mips solaris ~amd64-linux ~x64-solaris"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/66-sourcecode.conf" )

S="${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it/TTF"
FONT_SUFFIX="ttf"

src_install() {
       insinto /usr/share/fonts/${PN}
       doins ${WORKDIR}/source-code-pro-2.030R-ro-1.050R-it/TTF/*.ttf
       font_xfont_config
       font_fontconfig
}

