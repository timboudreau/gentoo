EAPI=7

DESCRIPTION=""
HOMEPAGE="http://karashata.deviantart.com/art/Shiki-Nouveau-2012-11-01-318365469"
SRC_URI="http://timboudreau.com/files/shiki-nouveau-1.0.tar.xz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-wm/openbox"
DEPEND=""

S="${WORKDIR}/${P/_/-}"

SLOT=0

src_compile() { :; }
src_test() { :; }

src_install() {
	insinto /usr/share/themes/Shiki-Nouveau-Humandust/openbox-3/
	doins Shiki-Nouveau-Humandust/openbox-3/*
}
