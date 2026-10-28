TERMUX_PKG_HOMEPAGE=https://github.com/nglmercer/termux-app
TERMUX_PKG_DESCRIPTION="Client for the opt-in Termux local control API"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@nglmercer"
TERMUX_PKG_VERSION=0.1.0+git20261028
# Draft source: replace with an accepted upstream release before publishing.
TERMUX_PKG_SRCURL=https://github.com/nglmercer/termux-app/archive/ab8262b83505b288a61f11d0d2ab1697c9c4f4fc.tar.gz
TERMUX_PKG_SHA256=36ffc1ec34bc14030cf652b5af8ae9efe79ee455bbaf6c63574c9ec1843c3b54

termux_step_make() {
	$CC $CFLAGS -std=c11 -Wall -Wextra -Werror \
		"$TERMUX_PKG_SRCDIR/tools/termux-control/termux-control.c" \
		$LDFLAGS -o "$TERMUX_PKG_BUILDDIR/termux-control"
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_BUILDDIR/termux-control" "$TERMUX_PREFIX/bin/termux-control"
}
