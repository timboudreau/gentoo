# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Near Field Communications (NFC) library - with Daniel O'Neill's patches for the arc122u card reader"
HOMEPAGE="http://www.libnfc.org/"
SRC_URI="https://github.com/nfc-tools/${PN}/releases/download/${PN}-1.7.1/${PN}-1.7.1.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc pcsc-lite readline static-libs usb"



PATCHES=(
	"${FILESDIR}/${P}-arc122.patch"
)

RDEPEND="pcsc-lite? ( sys-apps/pcsc-lite )
	readline? ( sys-libs/readline:0 )
	usb? ( virtual/libusb:0 )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

src_configure() {
	local drivers="arygon,pn532_uart,pn532_spi,pn532_i2c,acr122s"
	use pcsc-lite && drivers+=",acr122_pcsc"
	use usb && drivers+=",pn53x_usb,acr122_usb"
	econf \
		--with-drivers="${drivers}" \
		$(use_enable doc) \
		$(use_with readline) \
		$(use_enable static-libs static)
}

src_compile() {
	default
	use doc && doxygen
}

src_install() {
	default
	use static-libs || find "${ED}" -name 'lib*.la' -delete
	use doc && dohtml "${S}"/doc/html/*
}
