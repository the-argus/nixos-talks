{
  stdenv,
  gtk4,
  fetchgit,
  ...
}:
stdenv.mkDerivation {
  pname = "example-gtk-app";
  version = "2023-01-27";
  src = fetchgit {
    url = "https://github.com/robertapengelly92/ExampleGtkApplication";
    sha256 = "0hbgxlyims26vmkz4vf1p73r2m035avlry02jiz5j9534czfbqbj";
    rev = "c550074b0a5862c0d38af13442a76124317ddcd3";
  };

  nativeBuildInputs = [gtk4];
}
