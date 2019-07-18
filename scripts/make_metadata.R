library(dplyr)
setwd("~/github/madagascar/")

# read in mapping info from Pasolli et al. 2019
sgb <- readxl::read_xlsx("inputs/SGBs_mappability.xlsx", 
                         col_names = c("dataset",	"sample",	
                                       "subsampled_reads", 
                                       "dataset_group",	
                                       "num_reads", 
                                       "num_bases", 
                                       "median_read_length", 
                                       "body_site",	
                                       "westernized",	
                                       "mappability_ncbi",
                                       "mapability_ncbi_sgbs_ref",	
                                       "mapability_ncbi_sgbs_all",
                                       "mappability_increase"),
                         skip = 2)

# read in ENA metadata and SRA accessions
ena <- read.table("inputs/PRJNA485056.txt", sep = "\t", header = T, stringsAsFactors = F)

# join
all <- left_join(ena, sgb, by = c( "library_name" = "sample"))

# write to metadata table
write.csv(all, "inputs/madagascar_metadata.csv", quote = F, row.names = F)
