EAPI=5
inherit git-2
inherit user

DESCRIPTION="A highly-available key value store for shared configuration and service discovery"
HOMEPAGE="https://github.com/etsy/statsd/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/etsy/statsd.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="man minimal"

DEPEND="man? ( app-text/ronn )"

RDEPEND=">=net-libs/nodejs-0.8.8"

src_compile() {
    ebegin "Building statsd man pages"
    if use man ; then
        ronn -m ${WORKDIR}/statsd-${PV}/README.md > ${T}/statsd.1
        ronn -m ${WORKDIR}/statsd-${PV}/docs/backend.md > ${T}/statsd.2
        ronn -m ${WORKDIR}/statsd-${PV}/docs/graphite.md > ${T}/statsd.3
        ronn -m ${WORKDIR}/statsd-${PV}/docs/namespacing.md > ${T}/statsd.4
        ronn -m ${WORKDIR}/statsd-${PV}/docs/admin_interface.md > ${T}/statsd.5
    fi
    eend ${?}
}

src_install() {
    ebegin "Installing statsd, man pages and init scripts"
    dobin ${FILESDIR}/statsd
    dodir /usr/lib/statsd
    dodir /usr/lib/statsd/backends
    dodir /usr/lib/statsd/lib
    cp -R ${WORKDIR}/statsd-${PV}/lib/* ${D}/usr/lib/statsd/lib/
    cp -R ${WORKDIR}/statsd-${PV}/backends/* ${D}/usr/lib/statsd/backends/
    cp ${WORKDIR}/statsd-${PV}/package.json ${D}/usr/lib/statsd/
    cp ${WORKDIR}/statsd-${PV}/stats.js ${D}/usr/lib/statsd/
    cp ${WORKDIR}/statsd-${PV}/proxy.js ${D}/usr/lib/statsd/

    dodir /etc
    if ! use minimal ; then
        dodir /usr/share/statsd/examples
        cp -R ${WORKDIR}/statsd-${PV}/examples/* ${D}/usr/share/statsd/examples
    fi
    cp ${WORKDIR}/statsd-${PV}/exampleConfig.js ${D}/etc/statsd-config.js

    newinitd "${FILESDIR}"/statsd.initd statsd
    newconfd "${FILESDIR}"/statsd.confd statsd
    if use man ; then
        doman ${T}/statsd.1
        doman ${T}/statsd.2
        doman ${T}/statsd.3
        doman ${T}/statsd.4
        doman ${T}/statsd.5
    fi
    eend ${?}
}

pkg_postinst() {
	ebegin "Creating statsd user"
	enewgroup statsd
	enewuser statsd -1 -1 -1 statsd
	dodir /var/log/statsd
	dodir /var/run/statsd
	fowners statsd /var/run/statsd
	fowners statsd /var/log/statsd
	eend ${?}
}
