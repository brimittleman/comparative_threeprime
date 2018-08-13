#!/bin/bash

source activate comp_threeprime_env

snakemake \
    -kp \
    --ri \
    -j 500 \
    --rerun-incomplete \
    --cluster-config cluster.json \
    -c "sbatch \
        --mem={cluster.mem} \
        --nodes={cluster.n} \
        --tasks-per-node={cluster.tasks} \
        --partition=broadwl \
        --job-name={cluster.name} \
	      --output={cluster.logfile}" \
    $*