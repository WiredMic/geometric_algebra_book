# Basic LuaLaTeX configuration
$pdf_mode = 4;  # Use LuaLaTeX
$lualatex = 'lualatex --shell-escape -interaction=nonstopmode';  # Enable shell-escape for external libs
@default_files [("triple_product.tex")];

# settings
$allow_subdir_creation = 1;
$aux_dir = "tmp";
$out_dir = ".";
&set_tex_cmds( '-shell-escape %O '
        . '\'\PassOptionsToPackage{outputdir={$out_dir}}{minted}\input{%S}\''
        );

# Configure clean up
$clean_ext = "aux bbl blg idx ind lof lot out toc acn thm tdo acr alg glg glo gls ist fls log fdb_latexmk pdf_tex md5 dpth dep auxlock";
$cleanup_includes_cusdep_generated = 1;
$cleanup_includes_generated = 1;

# Add tikzexternal directory to cleanup
@generated_exts, 'auxlock', 'figlist';

# # Configure TikZ externalization directory
# $ENV{'TEXINPUTS'}='./tikz/:' . $ENV{'TEXINPUTS'};

# # Custom subroutine to handle TikZ external figures
# sub tikz_externalize {
#     return system("mkdir -p tikz") if ! -d "tikz";
# }

# # Add the subroutine to the file processing
# add_cus_dep('tex', 'tikz', 0, 'tikz_externalize');
