EAPI=5
inherit git-2
inherit user

DESCRIPTION="A dropbox-like file synchronization tool"
HOMEPAGE="https://github.com/syncthing/syncthing"
SRC_URI=""

EGIT_REPO_URI="https://github.com/syncthing/syncthing"
EGIT_COMMIT="v${PV}"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-lang/go"

_DEST=${WORKDIR}/src/github.com/syncthing/syncthing

src_compile() {
	ebegin "Building syncthing ${EGIT_COMMIT}"
	SRCS=${WORKDIR}/src/github.com/syncthing
	mkdir -p ${SRCS}/syncthing
	mv ${WORKDIR}/syncthing-${PV}/* ${SRCS}/syncthing
	mv ${WORKDIR}/syncthing-${PV}/.g* ${SRCS}/syncthing
	rmdir ${WORKDIR}/syncthing-${PV}
	ln -s ${SRCS}/syncthing ${WORKDIR}/syncthing-${PV}
	echo "Using go path ${WORKDIR}/src"
	echo "S is ${S}"
	echo "D is ${D}"
	cd ${_DEST}
	go run ${_DEST}/build.go
	eend ${?}
}

src_install() {
	ebegin "Installing syncthing"
	for BINFILE in ${_DEST}/bin/*; do
		echo "Install $BINFILE"
		dobin $BINFILE
	done 

	FILES=`find ${_DEST}/man -regex ".*?\.[123456789]"`
	echo "MAN PAGES: ${FILES}"

	for MANFILE in ${FILES}; do
		echo "Man $MANFILE"
		doman $MANFILE
	done
	
	newinitd "${FILESDIR}"/syncthing.initd-openrc-run syncthing
	newconfd "${FILESDIR}"/syncthing.conf syncthing
	echo "Created /etc/init.d/syncthing to launch on startup"
	echo "If you want to use this, edit /etc/conf.d/syncthing and set the USER variable to your user name."
	echo "Then run"
	echo "	rc-update add syncthing default"
	echo "to enable it on startup"
	echo ""
	echo "Once syncthing is running, go to http://localhost:8384/ to set up files to synchronize."
    eend ${?}
}

pkg_postinst() {
	ebegin "Creating /etc/init.d/syncthing"
	eend ${?}
}
