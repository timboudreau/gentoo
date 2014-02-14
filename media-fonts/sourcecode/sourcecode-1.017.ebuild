EAPI=3
inherit font

MY_PN="SourceCodePro"
P="archive"
DESCRIPTION="Adobe's open source coding font"
HOMEPAGE="http://sourceforge.net/projects/sourcecodepro.adobe/"

SRC_URI="http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsourcecodepro.adobe%2Ffiles%2F&ts=1392365435&use_mirror=colocrossing -> source-code-pro-${PV}.zip"
LICENSE="Open Font License 1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd mips solaris ~amd64-linux ~x64-solaris"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/66-sourcecode.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}

	doins ${WORKDIR}/SourceCodePro_FontsOnly-1.017/TTF/*.ttf

	font_xfont_config
	font_fontconfig
}
