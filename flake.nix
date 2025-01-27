{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {system = "x86_64-linux";};

    developEnv = pkgs.clangStdenv;
  in {
    devShells.x86_64-linux.default = with pkgs;
      pkgs.mkShell.override {stdenv = developEnv;} {
        name = "developEnv";
        nativeBuildInputs = [cmake pkg-config];
        buildInputs = [glm glfw glew zlib libpng libvorbis openal luajit curl]; # libglvnd
        packages = [glfw mesa freeglut entt ninja];
        LD_LIBRARY_PATH = "${wayland}/lib:$LD_LIBRARY_PATH";
      };
  };
}
