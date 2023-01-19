Julia v1.9.0-beta3 segfaults when loading Revise while running with a sysimage. Run `docker build .` to reproduce.

```
[8] signal (11.1): Segmentation fault
in expression starting at none:1
immut_id_ at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/builtins.c:385
type_hash at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/jltypes.c:1195
typekey_hash at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/jltypes.c:1207 [inlined]
jl_cache_type_ at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/jltypes.c:888
jl_restore_system_image_from_stream_ at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/staticdata.c:3036
jl_restore_package_image_from_stream at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/staticdata.c:3314
jl_restore_incremental_from_buf at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/staticdata.c:3360
ijl_restore_package_image_from_file at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/staticdata.c:3473
_include_from_serialized at ./loading.jl:1001
_tryrequire_from_serialized at ./loading.jl:1298
_require_search_from_serialized at ./loading.jl:1401
_require at ./loading.jl:1690
jfptr__require_52570 at /sysimage/sysimage.so (unknown line)
tojlinvoke67850 at /sysimage/sysimage.so (unknown line)
j__require_24394 at /sysimage/sysimage.so (unknown line)
_require_prelocked at ./loading.jl:1567
jfptr__require_prelocked_24391 at /sysimage/sysimage.so (unknown line)
tojlinvoke67936 at /sysimage/sysimage.so (unknown line)
j__require_prelocked_24116 at /sysimage/sysimage.so (unknown line)
macro expansion at ./loading.jl:1555 [inlined]
macro expansion at ./lock.jl:267 [inlined]
require at ./loading.jl:1518
jfptr_require_24103 at /sysimage/sysimage.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/gf.c:2681 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/gf.c:2863
jl_apply at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/julia.h:1874 [inlined]
call_require at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/toplevel.c:466 [inlined]
eval_import_path at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/toplevel.c:503
jl_toplevel_eval_flex at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/toplevel.c:731
jl_toplevel_eval_flex at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/toplevel.c:856
ijl_toplevel_eval_in at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/toplevel.c:971
eval at ./boot.jl:370 [inlined]
exec_options at ./client.jl:280
jfptr_exec_options_42010 at /sysimage/sysimage.so (unknown line)
tojlinvoke67919 at /sysimage/sysimage.so (unknown line)
j_exec_options_24155 at /sysimage/sysimage.so (unknown line)
_start at ./client.jl:522
jfptr__start_24153 at /sysimage/sysimage.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/gf.c:2681 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/gf.c:2863
jl_apply at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/julia.h:1874 [inlined]
true_main at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/jlapi.c:573
jl_repl_entrypoint at /cache/build/default-amdci4-7/julialang/julia-release-1-dot-9/src/jlapi.c:717
main at julia (unknown line)
unknown function (ip: 0x7fc4eee29d8f)
__libc_start_main at /lib/x86_64-linux-gnu/libc.so.6 (unknown line)
unknown function (ip: 0x401098)
Allocations: 2989 (Pool: 2978; Big: 11); GC: 0
Segmentation fault
```
