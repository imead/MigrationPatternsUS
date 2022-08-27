#Import and exploration of od.csv
# From documentation included, 

library(readr)
library(dplyr)
library(tidyr)

od_url <- "C:/Users/ivylm/Git/MigrationPatternsUS/od.csv"
od_ds <- read.table (file = od_url, header = TRUE, sep = ",")

# o_cz is zone where individual lived at age 16
# o_cz_name is where name of the zone
# o_state_name is there state name zone is in
# d_cz is where individual lived at age 26
# n is count from o living in d 
# n_tot_o is number from o 
# n_tot_d number in d 
# pool is race and parential income quintile combined
# pr_d_o is probability D|o and pr_o_d is opposite

head(od_ds)

# Load with readr
od_ds1 <- read_csv(od_url, skip=1, col_names=c("origin_key","origin_name", "origin_state", "dest_key","dest_name",
                                                "dest_state", "d_from_o", "n_o", "n_d", "pool", "pr_d_o", "pr_o_d"))

# ~13.7 million rows, 12 columns
glimpse(od_ds1)

# drop last two columns
od_ds2 <- od_ds1 %>%
  select (-c(pr_d_o, pr_o_d))

# separate pool into separate race and income categories.
od_ds3 <- separate(od_ds2,col=pool, into=c('Race','Income'), sep='Q')
  head(od_ds3)

# look at distinct Race categories
# Asian, Black, Hispanic, Other, White
unique(od_ds3$Race)