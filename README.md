# abap-conf-2026-hello-world

This repository tracks a **Hello World** ABAP report built on the A4H trial system.

## Programs

| Program | Description |
|---|---|
| **ZR_HELLO_WORLD** | Classic Hello World report — writes `Hello World` to the ABAP list output |
| **ZR_FLIGHT_LIST** | Flight data ALV list — fetches and displays flight data from `SFLIGHT`, `SCARR`, and `SPFLI` using `cl_salv_table` |

Both programs live in package `$TMP` on the A4H trial system.

## Background

Built by the Squad ABAP team as part of **abap-conf-2026**.  
Source is maintained abapGit-style under `src/`.

| File | Description |
|---|---|
| `src/zr_hello_world.prog.abap` | ZR_HELLO_WORLD source |
| `src/zr_flight_list.prog.abap` | ZR_FLIGHT_LIST source |
