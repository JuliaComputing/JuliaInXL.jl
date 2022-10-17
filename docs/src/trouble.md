# JuliaIn XL troubleshooting guide

## Analysis Toolpak 

In the current version of JuliaInXL, if your Excel installation has loaded the "Analysis Toolpak - VBA" add-in, then the Julia process does not launch automatically on startup.  In this scenario, you must launch the julia.exe process manually using the "Launch Local Julia" button.

## Resolving `#JuliaNotConnected!` error messages

If an execution of `jlcall` has resulted in a `#JuliaNotConnected` error, then either the "Launch Local Julia" button or the "Reconnect" button (described below) can be used to re-establish a connection to a JuliaInXL server process.  The "Launch Local Julia" button launches a new julia.exe process, while the "Reconnect" button attempts to connect to a JuliaInXL server in an existing julia.exe process.

## Resolving `#JuliaNotConnected!` error messages

If an execution of `jlcall` has resulted in a `#JuliaNotConnected!` error, then either the "Launch Local Julia" button or the "Reconnect" button (described below) can be used to re-establish a connection to a JuliaInXL server process.  The "Launch Local Julia" button launches a new julia.exe process, while the "Reconnect" button attempts to connect to a JuliaInXL server in an existing julia.exe process.

## Resolving `#JuliaEmptyCell!` error messages

The `jlcall` function does not currently accept arguments whose inputs are cells or cell ranges that contain empty cells.  To resolve a `#JuliaEmptyCell!` error, the input cells or cell ranges must be modified such that they contain a value of some type.