FROM r-base:3.4.0
    RUN apt-get update && apt-get install -y libcurl4-gnutls-dev libxml2-dev libssl-dev libmariadb-client-lgpl-dev \
        ibglib2.0-dev libcairo2-dev ghostscript && apt-get clean && \
        rm -rf /var/lib/apt/lists/*
    RUN apt-get update && apt-get install libxt-dev && \
         rm -rf /var/lib/apt/lists/*
    RUN Rscript -e 'install.packages("devtools", dependencies = TRUE)'
    RUN Rscript -e 'library(devtools); install_github("brentp/celltypes450")'   
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("sva")'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("minfi")'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("RnBeads")'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("RnBeads.hg19")'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); \
        biocLite(pkgs=c("minfiData","ChAMPdata","wateRmelon","FDb.InfiniumMethylation.hg19","ChAMP", "FlowSorted.Blood.450k"))'        
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); \
        biocLite(pkgs=c("sandwich","lmtest","gap","ggplot2", "gdata","snpStats","GenomicRanges"))'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); \
        biocLite(pkgs=c("DEXSeq","lumi","RnBeads.hg19","RnBeads","impute","illuminaio","wateRmelon","limma","methylumi"))'
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); \
        biocLite(pkgs=c("Biobase","IRanges","AnnotationDbi","MASS","IlluminaHumanMethylation450k.db","IlluminaHumanMethylation450kmanifest","CopyNumber450kData","DNAcopy"))'
    RUN Rscript -e 'install.packages(c("Hmisc","devtools","MASS","lmtest","gplots","markdown","Cairo","knitr","doParallel","compareGroups","MatrixEQTL","plyr","dplyr","matrixStats","sandwich","ggplot2","glmnet","VennDiagram","parallel"))'
