EAPI=5
inherit git-2
inherit user

DESCRIPTION="A highly-available key value store for shared configuration and service discovery"
HOMEPAGE="https://github.com/coreos/etcd"
SRC_URI=""

EGIT_REPO_URI="https://github.com/coreos/etcd.git"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go app-text/ronn"

RDEPEND=""

src_compile() {
    ebegin "Building etcd"
    cd ${WORKDIR}/etcd-${PV}
    if [ ! -h ${WORKDIR}/etcd-${PV}/src/github.com/coreos/etcd ]; then
	mkdir -p ${WORKDIR}/etcd-${PV}/src/github.com/coreos/
	ln -s ../../.. ${WORKDIR}/etcd-${PV}/src/github.com/coreos/etcd
    fi
    export GOBIN=${WORKDIR}/etcd-${PV}/bin
    export GOPATH=${WORKDIR}/etcd-${PV}
    go install github.com/coreos/etcd
    go install github.com/coreos/etcd/bench
    ronn -m ${WORKDIR}/etcd-${PV}/Documentation/configuration.md > ${T}/etcd.1
    ronn -m ${WORKDIR}/etcd-${PV}/Documentation/modules.md > ${T}/etcd.2
    ronn -m ${WORKDIR}/etcd-${PV}/Documentation/clustering.md > ${T}/etcd.3
    ronn -m ${WORKDIR}/etcd-${PV}/Documentation/api.md > ${T}/etcd.4
    eend ${?}
}

src_install() {
    ebegin "Installing binaries and init scripts"
    dobin ${WORKDIR}/etcd-${PV}/bin/etcd
    dobin ${WORKDIR}/etcd-${PV}/bin/bench
    newinitd "${FILESDIR}"/etcd.initd etcd
    newconfd "${FILESDIR}"/etcd.confd etcd
    doman ${T}/etcd.1
    doman ${T}/etcd.2
    doman ${T}/etcd.3
    doman ${T}/etcd.4
    eend ${?}
}

pkg_setup() {
	ebegin "Creating etcd user"
	enewgroup etcd
	enewuser etcd -1 -1 /var/lib/etcd etcd
	dodir /var/lib/etcd
	dodir /var/log/etcd
	dodir /var/run/etcd
	fowners etcd /var/run/etcd
	fowners etcd /var/log/etcd
	eend ${?}
}
