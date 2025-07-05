pkgname=initcpio-hook-shadowcopy
pkgver=1.0.0
pkgrel=1
pkgdesc='initcpio hook to copy /etc/shadow (or /etc/shadow.initramfs) to the initramfs, for root account debugging usage'
url='https://github.com/iTrooz/initcpio-hook-shadowcopy'
license=('Apache-2.0')
arch=('any')
depends=('mkinitcpio')
source=("shadowcopy-initcpio-install.sh")
sha256sums=('0406553fcf7cc47ef2acff126ae84788ba9fd5124adacebdfc45b985920c229b')
install=shadowcopy.install

package() {
  install -Dm644 "$srcdir/shadowcopy-initcpio-install.sh" "$pkgdir/usr/lib/initcpio/install/shadowcopy"
}
