EAPI=3

MY_PN="mutt-colors-solarized"
P="archive"
DESCRIPTION="A color theme for mutt"
HOMEPAGE="https://github.com/altercation/mutt-colors-solarized.git"

SRC_URI="https://github.com/altercation/mutt-colors-solarized.git"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND="mail-client/mutt"
#src_unpack() {
#	unpack ${A}
#	mv "${WORKDIR}/archive" "${WORKDIR}/blog-0.1.1"
#}


src_install() {
	insinto /usr/share/fonts/${PN}

	for f in "${MY_PN}" "${MY_PN}P" "${MY_PN}PB" "${MY_PN}PS" ; do
		cd "${WORKDIR}/${f}-${PV}"
		doins fonts/*.ttf
		newdoc README README.${f}
		newdoc README.ja README.ja.${f}
		newdoc ChangeLog ChangeLog.${f}
	done

	font_xfont_config
	font_fontconfig
}
