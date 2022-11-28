#!/bin/bash

# Download the memory intensive SPEC CPU2017 traces
# 
# @Author: Navarro Torres, Agustín
# @Date: 25/07/2022
#

DIR="$1"
URL="https://dpc3.compas.cs.stonybrook.edu/champsim-traces/speccpu/"
TRACES=(
    '602.gcc_s-734B.champsimtrace.xz'
    '602.gcc_s-1850B.champsimtrace.xz'
    '602.gcc_s-2226B.champsimtrace.xz'
    '603.bwaves_s-891B.champsimtrace.xz'
    '603.bwaves_s-1740B.champsimtrace.xz'
    '603.bwaves_s-2609B.champsimtrace.xz'
    '603.bwaves_s-2931B.champsimtrace.xz'
    '605.mcf_s-472B.champsimtrace.xz'
    '605.mcf_s-484B.champsimtrace.xz'
    '605.mcf_s-665B.champsimtrace.xz'
    '605.mcf_s-782B.champsimtrace.xz'
    '605.mcf_s-994B.champsimtrace.xz'
    '605.mcf_s-1152B.champsimtrace.xz'
    '605.mcf_s-1536B.champsimtrace.xz'
    '605.mcf_s-1554B.champsimtrace.xz'
    '605.mcf_s-1644B.champsimtrace.xz'
    '607.cactuBSSN_s-2421B.champsimtrace.xz'
    '607.cactuBSSN_s-3477B.champsimtrace.xz'
    '607.cactuBSSN_s-4004B.champsimtrace.xz'
    '619.lbm_s-2676B.champsimtrace.xz'
    '619.lbm_s-2677B.champsimtrace.xz'
    '619.lbm_s-3766B.champsimtrace.xz'
    '619.lbm_s-4268B.champsimtrace.xz'
    '620.omnetpp_s-141B.champsimtrace.xz'
    '620.omnetpp_s-874B.champsimtrace.xz'
    '621.wrf_s-6673B.champsimtrace.xz'
    '621.wrf_s-8065B.champsimtrace.xz'
    '623.xalancbmk_s-10B.champsimtrace.xz'
    '623.xalancbmk_s-165B.champsimtrace.xz'
    '623.xalancbmk_s-202B.champsimtrace.xz'
    '623.xalancbmk_s-325B.champsimtrace.xz'
    '623.xalancbmk_s-592B.champsimtrace.xz'
    '623.xalancbmk_s-700B.champsimtrace.xz'
    '627.cam4_s-490B.champsimtrace.xz'
    '628.pop2_s-17B.champsimtrace.xz'
    '649.fotonik3d_s-1176B.champsimtrace.xz'
    '649.fotonik3d_s-7084B.champsimtrace.xz'
    '649.fotonik3d_s-8225B.champsimtrace.xz'
    '649.fotonik3d_s-10881B.champsimtrace.xz'
    '654.roms_s-293B.champsimtrace.xz'
    '654.roms_s-294B.champsimtrace.xz'
    '654.roms_s-523B.champsimtrace.xz'
    '654.roms_s-1070B.champsimtrace.xz'
    '654.roms_s-1390B.champsimtrace.xz'
)
NUM_TRACES=${#TRACES[@]}

# Terminal colors
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'

mkdir -p $DIR > /dev/null 2>&1

echo "Download SPEC CPU2017 traces [0/$NUM_TRACES] "
num=0
for i in "${TRACES[@]}"; do
    # Download spec traces
    if [[ "$VERBOSE" == "Y" ]]; then
        curl --progress-bar $URL$i --output $DIR/$i
    elif [[ "$LOGGED" == "Y" ]]; then
        curl --progress-bar $URL$i --output $DIR/$i >> $LOG 2>&1
    else
        curl --progress-bar $URL$i --output $DIR/$i 2>&1 | tr -d '\n'
    fi
    num=$(($num + 1))
    echo "Download SPEC CPU2017 traces [$num/$NUM_TRACES]"
done
echo -e "Download SPEC CPU2017 traces ${GREEN}[$num/$NUM_TRACES]${NC}"
