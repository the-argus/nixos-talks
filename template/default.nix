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
    url = "https://github.com/rajeshsola/gnu-hello";
    sha256 = "0nzfkfyq5mfaslwgfw3hrz58ca7q275xsqj297xwblqv8v0g2n3n";
    rev = "274bd5b954066558a5ead00d3cceefe21ecdba9b";
  };

  # this package does not need gtk4 lol but its an example
  nativeBuildInputs = [gtk4];
}
