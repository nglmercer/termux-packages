TERMUX_PKG_HOMEPAGE=https://github.com/nglmercer/termux-app
TERMUX_PKG_DESCRIPTION="Client for the opt-in Termux local control API"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@nglmercer"
TERMUX_PKG_VERSION=0.1.0+git20261028
# Draft source: replace with an accepted upstream release before publishing.
TERMUX_PKG_SRCURL=https://github.com/nglmercer/termux-app/archive/f56164fa71f53d3e5b8cf51bfc27a8bfc05aeaa3.tar.gz
TERMUX_PKG_SHA256=19fa19c7d9fb83ee6c3aae8f6f0b9c2323d4f652763df859dae65da97d97e148

termux_step_make() {
	$CC $CFLAGS -std=c11 -Wall -Wextra -Werror \
		"$TERMUX_PKG_SRCDIR/tools/termux-control/termux-control.c" \
		$LDFLAGS -o "$TERMUX_PKG_BUILDDIR/termux-control"
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_BUILDDIR/termux-control" "$TERMUX_PREFIX/bin/termux-control"
}
