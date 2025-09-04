{self, ...}: {
    imports = [

    ];
    programs.nixvim = {
        enable = true;

        colorschemes.vscode.enable = true;
    };
}
