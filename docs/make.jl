using Documenter, JuliaInXL

load_dir(x) = map(file -> joinpath("lib", x, file), readdir(joinpath(Base.source_dir(), "src", "lib", x)))

makedocs(
    modules = [JuliaInXL],
    clean = false,
    format = [:html, :latex],
    sitename = "JuliaInXL",
    pages = Any[
        "Introduction" => "index.md",
        "Tutorial" => "tutorial.md"
    ],
    assets = ["assets/jc.css"]
)

deploydocs(
    repo   = "github.com/JuliaComputing/JuliaInXL.jl.git",
    julia  = "0.5",
    osname = "windows",
    deps   = nothing,
    make   = nothing,
    target = "build",
)
