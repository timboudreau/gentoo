EAPI=4

DESCRIPTION="A simple but pleasant low-overhead desktop environment"
HOMEPAGE="http://timboudreau.com/desktop"
SRC_URI="ftp://ftp.gnu.org/pub/gnu/libiconv/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="wallpaper mutt terminal menus tray composite"

DEPEND="!sys-libs/glibc"

RDEPEND="x11-wm/openbox
wallpaper ( media-gfx/feh )
x11-misc/cairo-dock
x11-plugins/cairo-dock-plugins
menus ? ( x11-misc/obmenu-generator )
mutt ? ( mail-client/mutt )
sys-apps/dbus
sys-auth/consolekit
tray ? ( x11-misc/stalonetray )
composite ? ( x11-misc/compton )
composite ? ( x11-apps/transset )"

src_configure() {
    econf $(use_enable nls)
}

src_install() {
    emake DESTDIR="${D}" install
}
