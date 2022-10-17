using Documenter, JuliaInXL

load_dir(x) = map(file -> joinpath("lib", x, file), readdir(joinpath(Base.source_dir(), "src", "lib", x)))


makedocs(
    modules = [JuliaInXL],
    clean = true,
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/jc.css"],
        warn_outdated = true,
        collapselevel=1,
        ),
    sitename = "JuliaInXL",
    pages = Any[
        "Introduction" => "index.md",
        "Tutorial" => "tutorial.md",
        "Advanced" => "advanced.md",
        "Troubleshooting" => "trouble.md",
    ]
)
