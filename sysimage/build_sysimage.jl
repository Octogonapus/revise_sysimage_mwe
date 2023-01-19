using PackageCompiler

function build()
    sysimage_path = joinpath(@__DIR__, "sysimage.so")
    create_sysimage(
        ["Foo"];
        project=dirname(@__DIR__),
        sysimage_path,
        cpu_target="generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1)",
        incremental=true,
        include_transitive_dependencies=true
    )
    return sysimage_path
end
