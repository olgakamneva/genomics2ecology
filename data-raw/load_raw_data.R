## Network of gene families connected by gene neighbor scores.
network = scan("data-raw/COG_links_GN_unit_norm_th275_unique", quiet = T, what="character", sep="\n")
network = matrix(unlist(strsplit(network, "\t")), ncol=3, byrow=T)
reference_network = as.data.frame(network, stringsAsFactors = FALSE)
reference_network[, 3] = as.numeric(network[, 3])
names(reference_network)=c("node1", "node2", "weight")

## Sets of gene families of size 2 or larger detected by MCL in the network of gene families.
sets = scan("data-raw/mcl_GN275_I40", what="character", sep="\n", quiet = T)
size = strsplit(sets, "\t")
size = unlist(lapply(size, length))
reference_gene_sets = strsplit(sets[size > 1], "\t")

## Gene families present in Bacteroides fragilis 3_1_12 genome
families = scan(paste("data-raw/families_457424", sep = ""), what = "character", sep = "\n", quiet = TRUE)
families_Bf = matrix(unlist(strsplit(families[-1], "\t")), ncol=3, byrow=T)[, 2]

## Gene families present in Eubacterium rectale DSM 17629 genome
families = scan(paste("data-raw/families_657318", sep = ""), what = "character", sep = "\n", quiet = TRUE)
families_Er = matrix(unlist(strsplit(families[-1], "\t")), ncol=3, byrow=T)[, 2]

## Write data files to data/
devtools::use_data(reference_network, reference_gene_sets, families_Er, families_Bf, overwrite = TRUE)




