{
    description = "Software for computing the winning strategies of combinatorial games";

    inputs.nixpkgs.url = github:NixOS/nixpkgs/5fc085988400e9723b81b5d13423bb8ed030334d;

    outputs = { self, nixpkgs }: {
        defaultPackage.x86_64-linux =
            with import nixpkgs { system = "x86_64-linux"; };
            stdenv.mkDerivation {
                pname = "glop";
                version = "0.2.2";
                
                src = fetchzip {
                    url = "http://download.tuxfamily.org/sprouts/glop-2.2.tar.bz2";
                    hash = "sha256-WDgZi2GdyfAq2TtKYz9NAwZNvy0apkXrBNO5RNxPl1Q=";
                    stripRoot = true;
                };

                buildInputs = [
                    qt4
                ];

                buildPhase = ''
                    qmake
                    make
                '';

                installPhase = ''
                    mkdir -p $out/bin
                    install -t $out/bin ./bin/glop
                '';
            };
    };
}
