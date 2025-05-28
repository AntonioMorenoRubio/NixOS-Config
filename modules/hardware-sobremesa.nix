{ config, pkgs, ... }:

{
  fileSystems."/mnt/PROFESIONAL" = {
    device = "/dev/disk/by-uuid/7C0C61210C60D822";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" ];
  };

  fileSystems."/mnt/PERSONAL" = {
    device = "/dev/disk/by-uuid/E4F2AAB0F2AA8680";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" ];
  };

  fileSystems."/mnt/OTROS" = {
    device = "/dev/disk/by-uuid/AC62CD7662CD45B4";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" ];
  };

  fileSystems."/mnt/JUEGOS" = {
    device = "/dev/disk/by-uuid/712215b5-1d4f-44ce-bf23-c9f3718b648f";
    fsType = "ext4";
  };
}
