{ runCommand, catalogs }:
let
  dep_python3Packages_adutils = catalogs.brantley.python3Packages.adutils;
  dep_python3Packages_flox_find_net = catalogs.brantley.python3Packages.flox-find-net;
  dep_python3Packages_flox_panic = catalogs.brantley.python3Packages.flox-panic;
  dep_python3Packages_flox_telemetry = catalogs.brantley.python3Packages.flox-telemetry;
in
runCommand "flox-palotools-1" { pname = "flox-palotools"; version = "1"; inputs = [ dep_python3Packages_adutils dep_python3Packages_flox_find_net dep_python3Packages_flox_panic dep_python3Packages_flox_telemetry ]; } ''
  sleep 7
  mkdir -p "$out/share"
  printf '%s\n' "python3Packages.flox-palotools" > "$out/share/name"
  for i in $inputs; do printf '%s\n' "$i"; done > "$out/share/inputs"
''
