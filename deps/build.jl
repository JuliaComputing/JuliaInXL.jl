using Pkg
using Pkg.Artifacts

if Sys.iswindows()
    juliainxl_exe_path = joinpath(artifact"JuliaInXL","JuliaPro_JuliaInXL_v1.1.2.1.exe")    
	run(`cmd /c $(juliainxl_exe_path) $(Sys.BINDIR)`)
else
	@error("Your operating system is not compatible with JuliaInXL. This package works only on Windows")
end