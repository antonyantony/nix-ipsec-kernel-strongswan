{
	buildLinux, lib, ...
} @ args:
buildLinux (args // rec {
  version = "6.4.0-ipsec";
  modDirVersion = "6.4.0";

  src = fetchGit {
    url = "https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git";
    shallow = true;
    ref = "testing";
  };

  kernelPatches  = [];

  extraStructuredConfig = with lib.kernel; {
    XFRM_USER = yes;
  };
} // (args.argsOverride or {}))
