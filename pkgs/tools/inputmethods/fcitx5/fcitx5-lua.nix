{ lib, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, fcitx5
, lua5_3
, luaPackage ? lua5_3
, gettext
}:

stdenv.mkDerivation rec {
  pname = "fcitx5-lua";
  version = "5.0.4";

  src = fetchFromGitHub {
    owner = "fcitx";
    repo = "fcitx5-lua";
    rev = version;
    sha256 = "sha256-1gKfFq+x/tCOYqESO49Qddp5z6zXO7ULjTJgDEl8BqI=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

  buildInputs = [
    fcitx5
    luaPackage
    gettext
  ];

  meta = with lib; {
    description = "Lua support for Fcitx 5";
    homepage = "https://github.com/fcitx/fcitx5-lua";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ poscat ];
    platforms = platforms.linux;
  };
}
