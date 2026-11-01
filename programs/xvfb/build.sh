#!/bin/sh
# Build a relocatable Xvfb bundle KIQR installs for the hosted browser on
# Linux (`requires` in browser/extension.yaml), so no one has to install a
# system package. Ubuntu 22.04's Xvfb (xorg-server 21.1: the engine needs
# `-terminate <delay>`, which 1.20 lacks) with the libraries it links (glibc
# stays the host's: 22.04's 2.35 covers every distribution KIQR targets; older
# ones fall back to the system's package), the XKB data, and a launcher that
# points Xvfb at its own libraries.
#
#   programs/xvfb/build.sh x86_64 out/     -> out/xvfb-<version>-linux-x86_64.tar.gz and its .sha256
#   programs/xvfb/build.sh aarch64 out/    (needs qemu binfmt for arm64 containers)
#
# Publish the tarballs as a GitHub release `xvfb-<version>` on kiqr/programs
# and put the version and sha256 values into browser/extension.yaml.
set -eu
arch=${1:-x86_64}
out=${2:-out}
case "$arch" in
  x86_64) platform=linux/amd64 ;;
  aarch64) platform=linux/arm64 ;;
  *) echo "arch is x86_64 or aarch64" >&2; exit 1 ;;
esac
mkdir -p "$out"
out=$(cd "$out" && pwd)
docker run --rm --platform "$platform" -v "$out:/out" ubuntu:jammy sh -c '
set -eu
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq >/dev/null 2>&1 || apt-get update
apt-get install -y -qq --no-install-recommends xvfb xkb-data x11-xkb-utils ca-certificates >/dev/null
version=$(dpkg-query -W xvfb | cut -f2 | sed "s/^2://; s/-.*//")
arch=$(uname -m)
root=/tmp/xvfb-$version
mkdir -p "$root/bin" "$root/libexec" "$root/lib" "$root/share/X11"
cp /usr/bin/Xvfb "$root/libexec/Xvfb"
cp /usr/bin/xkbcomp "$root/libexec/xkbcomp"
# Every library the two link, except glibc itself (the host provides it).
for bin in "$root/libexec/Xvfb" "$root/libexec/xkbcomp"; do
  ldd "$bin" | awk "/=> \\// { print \$3 }" | while read -r lib; do
    case "$(basename "$lib")" in
      libc.so*|libm.so*|libpthread.so*|libdl.so*|librt.so*|ld-linux*|libresolv.so*) ;;
      *) cp -L "$lib" "$root/lib/" ;;
    esac
  done
done
cp -r /usr/share/X11/xkb "$root/share/X11/xkb"
cat > "$root/bin/Xvfb" <<LAUNCH
#!/bin/sh
# Xvfb from KIQR'"'"'s bundle: its own libraries and XKB data, wherever it was unpacked (reached through a symlink or not).
self=\$(readlink -f "\$0" 2>/dev/null || echo "\$0")
here=\$(cd "\$(dirname "\$self")/.." && pwd)
export LD_LIBRARY_PATH="\$here/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
export PATH="\$here/libexec:\$PATH"
exec "\$here/libexec/Xvfb" -xkbdir "\$here/share/X11/xkb" "\$@"
LAUNCH
chmod 755 "$root/bin/Xvfb" "$root/libexec/Xvfb" "$root/libexec/xkbcomp"
printf "%s\n" "$version" > "$root/VERSION"
name=xvfb-$version-linux-$arch
tar -C /tmp -czf "/out/$name.tar.gz" "xvfb-$version"
( cd /out && sha256sum "$name.tar.gz" > "$name.tar.gz.sha256" )
echo "built $name ($(du -h /out/$name.tar.gz | cut -f1))"
'
