TERMUX_PKG_HOMEPAGE=https://github.com/nglmercer/termux-app
TERMUX_PKG_DESCRIPTION="Client for the opt-in Termux local control API"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@nglmercer"
TERMUX_PKG_VERSION=0.1.0+git20261028
# Draft source: replace with an accepted upstream release before publishing.
TERMUX_PKG_SRCURL=https://github.com/nglmercer/termux-app/archive/c61bbaf41feb2f42d637aeeee50cc27414665db0.tar.gz
TERMUX_PKG_SHA256=8efc0782e7c65b3e96f943e572b7f529dbbe0bd6f75d44c176ff2c14667b2671

termux_step_make() {
	$CC $CFLAGS -std=c11 -Wall -Wextra -Werror \
		"$TERMUX_PKG_SRCDIR/tools/termux-control/termux-control.c" \
		$LDFLAGS -o "$TERMUX_PKG_BUILDDIR/termux-control"
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_BUILDDIR/termux-control" "$TERMUX_PREFIX/bin/termux-control"
}
