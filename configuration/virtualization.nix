{ config, pkgs, pkgs-master, ... }:

{
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      spiceUSBRedirection.enable = true;
    };

    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
}
