EAPI="5"

inherit font

DESCRIPTION="A programming font with ligatures"
HOMEPAGE="https://github.com/tonsky/FiraCode"
SRC_URI="https://raw.githubusercontent.com/tonsky/FiraCode/master/FiraCode-Regular.ttf"

LICENSE="mozilla"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
        cp "${DISTDIR}/${A}" "${S}/${A//-${PV}}"
}

FONT_CONF=( "${FILESDIR}/70-bowman.conf" )

src_install() {
        insinto /usr/share/fonts/${PN}

        cd "${WORKDIR}"
        doins *.ttf

        font_xfont_config
        font_fontconfig
}
