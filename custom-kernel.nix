{ config, pkgs, ... }:
let
	custom-kernel = pkgs.callPackage ./kernel.nix {};
	configured-kernel = pkgs.linuxManualConfig {
			inherit (custom-kernel) src version modDirVersion;
			configfile = ./config;
			allowImportFromDerivation = true;
	};
in
{
	boot.kernelPackages = pkgs.linuxPackagesFor configured-kernel;
}
