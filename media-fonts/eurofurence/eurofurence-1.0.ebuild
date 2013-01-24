EAPI=3
inherit font

MY_PN="eurofurence"
P="archive"
DESCRIPTION="Eurofurence, a clean sans-serif font"
HOMEPAGE="http://www.dafont.com/eurofurence.font"

SRC_URI="http://img.dafont.com/dl/?f=eurofurence -> eurofurence.zip"
LICENSE="free"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

# Only installs fonts
RESTRICT="strip binchecks"
FONT_CONF=( "${FILESDIR}/62-eurofurence.conf" )

src_install() {
	insinto /usr/share/fonts/${PN}

	for f in "${MY_PN}" "${MY_PN}P" "${MY_PN}PB" "${MY_PN}PS" "${MY_PN}TTF" ; do
		cd "${WORKDIR}/${f}-${PV}"
		doins  *.ttf
		newdoc README README.${f}
		newdoc README.ja README.ja.${f}
		newdoc ChangeLog ChangeLog.${f}
	done

	font_xfont_config
	font_fontconfig
}

