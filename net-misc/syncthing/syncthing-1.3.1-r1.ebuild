EAPI=7

DESCRIPTION="A dropbox-like file synchronization tool"
HOMEPAGE="https://github.com/syncthing/syncthing"
#SRC_URI=""

#EGIT_REPO_URI="https://github.com/syncthing/syncthing"
#EGIT_COMMIT="v1.3.1-rc.1"

ACTUAL_VERSION="v1.3.1-rc.1"

EGO_PN="github.com/${PN}/${PN}"

EGO_VENDOR=(
	"github.com/AudriusButkevicius/go-nat-pmp 452c97607362b2ab5a7839b8d1704f0396b640ca"
	"github.com/AudriusButkevicius/pfilter c55ef6137fc6"
	"github.com/AudriusButkevicius/recli v0.0.5"
	"github.com/StackExchange/wmi cbe66965904d"
	"github.com/bkaradzic/go-lz4 7224d8d8f27e"
	"github.com/calmh/xdr v1.1.0"
	"github.com/ccding/go-stun be486d185f3d"
	"github.com/certifi/gocertifi a5e0173ced67"
	"github.com/chmduquesne/rollinghash a60f8e7142b5"
	"github.com/d4l3k/messagediff v1.2.1"
	"github.com/flynn-archive/go-shlex 3f9db97f8568"
	"github.com/getsentry/raven-go v0.2.0"
	"github.com/go-ole/go-ole v1.2.4"
	"github.com/gobwas/glob v0.2.3"
	"github.com/gogo/protobuf v1.3.0"
	"github.com/golang/groupcache 869f871628b6"
	"github.com/golang/mock v1.3.1"
	"github.com/jackpal/gateway v1.0.5"
	"github.com/kballard/go-shellquote 95032a82bc51"
	"github.com/kr/pretty v0.1.0"
	"github.com/lib/pq v1.2.0"
	"github.com/lucas-clemente/quic-go v0.12.0"
	"github.com/maruel/panicparse v1.3.0"
	"github.com/mattn/go-isatty v0.0.9"
	"github.com/minio/sha256-simd v0.1.1"
	"github.com/onsi/ginkgo v1.9.0"
	"github.com/onsi/gomega v1.6.0"
	"github.com/oschwald/geoip2-golang v1.3.0"
	"github.com/oschwald/maxminddb-golang v1.4.0"
	"github.com/petermattis/goid b0b1615b78e5"
	"github.com/pkg/errors v0.8.1"
	"github.com/prometheus/client_golang v1.1.0"
	"github.com/prometheus/client_model 14fe0d1b01d4"
	"github.com/prometheus/procfs v0.0.4"
	"github.com/rcrowley/go-metrics cac0b30c2563"
	"github.com/sasha-s/go-deadlock v0.2.0"
	"github.com/shirou/gopsutil 47ef3260b6bf"
	"github.com/syncthing/notify 69c7a957d3e2"
	"github.com/syndtr/goleveldb 758128399b1d"
	"github.com/thejerf/suture v3.0.2"
	"github.com/urfave/cli v1.22.1"
	"github.com/vitrun/qart bf64b92db6b0"
	"golang.org/x/crypto 9756ffdc2472 github.com/golang/crypto"
	"golang.org/x/net ba9fcec4b297 github.com/golang/net"
	"golang.org/x/sys 749cb33beabd github.com/golang/sys"
	"golang.org/x/text v0.3.2 github.com/golang/text"
	"golang.org/x/time 9d24e82272b4 github.com/golang/time"
	"gopkg.in/asn1-ber.v1 f715ec2f112d github.com/go-asn1-ber/asn1-ber"
	"gopkg.in/check.v1 788fd7840127 github.com/go-check/check"
	"gopkg.in/ldap.v2 v2.5.1 github.com/go-ldap/ldap"
        "github.com/golang/snappy v0.0.1"
        "github.com/onsi/ginkgo v1.7.0"
        "github.com/onsi/gomega v1.4.3"
        "github.com/cheekybits/genny v1.0.0"
        "github.com/golang/protobuf v1.3.2"
        "github.com/marten-seemann/qtls v0.3.2"
	# tests
	"github.com/cpuguy83/go-md2man/v2 v1.0.10 github.com/cpuguy83/go-md2man"
	"github.com/beorn7/perks v1.0.1"
	"github.com/prometheus/common v0.6.0"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
)
inherit user golang-vcs-snapshot xdg-utils

SRC_URI="https://${EGO_PN}/archive/${ACTUAL_VERSION}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

SLOT="0"
LICENSE="MPL"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""
DEPEND="dev-lang/go"
DOCS=( README.md AUTHORS CONTRIBUTING.md )


echo "EGO VENDOR URI: ${EGO_VENDOR_URI}"

#_DEST=${WORKDIR}/src/github.com/syncthing/syncthing

src_prepare() {
#	 Bug 679280
	xdg_environment_reset >/dev/null 2>&1
	default
}


src_compile() {
	export GOPATH="${S}:$(get_golibdir_gopath)"
	echo "GOPATH: ${GOPATH}"
	cd src/${EGO_PN} || die
	GO_FLAGS="-mod=vendor"
	GOPROXY=https://proxy.golang.org
	CGO_ENABLED="0"
	CGO_CFLAGS=${CFLAGS}
	CGO_CXXFLAGS=${CFLAGS}
	ebegin "Building syncthing ${EGO_PN}"
	go mod download github.com/shirou/gopsutil || die "Could now download gopsutil"

	echo "S is ${S}"
	echo "D is ${D}"
	go run build.go -version v1.3.1-rc.1 -no-upgrade install || die "Build failed"
	eend ${?}
}

src_install() {
	ebegin "Installing syncthing"
	_DEST="$S/src/github.com/${PN}/${PN}"
	for BINFILE in ${_DEST}/bin/*; do
		echo "Install $BINFILE"
		dobin $BINFILE
	done 

	FILES=`find $S/github.com/${PN}/${PN}/man -regex ".*?\.[123456789]"`
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

src_test() {
	cd src/${EGO_PN} || die
	go run build.go test || die "test failed"
}

pkg_postinst() {
	ebegin "Creating /etc/init.d/syncthing"
	eend ${?}
}
