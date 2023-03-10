process RUN_SALMON_INDEX {
    cpus 4
    memory "4.G"
    time "10.m"
    container "combinelab/salmon:1.10.0"
    storeDir "$params.store_dir"

    input:
    val(tx_ver)
    path(txome)

    output:
    path(idx)

    script:
    idx="salmon_index_${tx_ver}_1.10.0"
    """
    salmon index -t ${txome} -i ${idx}
    """

}