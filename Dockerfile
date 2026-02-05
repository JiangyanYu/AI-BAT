# Use the Shiny-verse base image for R and Shiny
FROM rocker/shiny-verse:4.3.3

# Install system dependencies required for some R packages
RUN apt-get update && apt-get install -y \
    libnetcdf-dev \
    libhdf5-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libglpk-dev \
    libgmp-dev \
    python3.10 \
    python3-pip \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install python libraries
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scikit-learn \
    umap-learn \
    matplotlib \
    seaborn \
    scipy \
    shap \
    tabpfn \
    "tabpfn-extensions[all]"

# Install Bioconductor manager
RUN R -e "install.packages('BiocManager', repos='https://cloud.r-project.org/')"

# Install specific versions of CRAN packages
RUN R -e "install.packages(c( \
    'magrittr'='2.0.4', 'dplyr'='1.1.4', 'data.table'='1.18.0', 'ggplot2'='4.0.1', 'tidyr'='1.3.2', 'purrr'='1.2.1', \
    'RColorBrewer'='1.1.3', 'gridExtra'='2.3', 'tibble'='3.3.1', 'shiny'='1.12.1','shinyWidgets'='0.9.0', 'DT'='0.34.0', 'png'='0.1.8', 'grid'='4.3.3' ), \
    repos='https://cloud.r-project.org/')"

# Install specific versions of Bioconductor packages
RUN R -e "BiocManager::install(c('Biostrings', 'ComplexHeatmap'), ask = FALSE, update = FALSE, dependencies = TRUE)"
RUN R -e "BiocManager::install(c('MSnbase', 'sva', 'mixOmics'), ask = FALSE, update = FALSE, dependencies = TRUE)"
RUN R -e "BiocManager::install(c('AnnotationDbi', 'IRanges', 'S4Vectors', 'GenomeInfoDb'), ask = FALSE, update = FALSE, dependencies = TRUE)"
RUN R -e "BiocManager::install(c('SummarizedExperiment', 'GenomicRanges', 'DESeq2', 'edgeR', 'limma'), ask = FALSE, update = FALSE, dependencies = TRUE)"
RUN R -e "BiocManager::install(c('org.Hs.eg.db', 'org.Mm.eg.db', 'clusterProfiler', 'HarmonizR', 'biomaRt', 'imputeLCMD'), ask = FALSE, update = FALSE, dependencies = TRUE)"

# Copy all necessary files into the container
COPY ./www /app/www/
COPY ./r_functions /app/r_functions/
COPY ./python_scripts /app/python_scripts
COPY ./data /app/data
COPY app.R /app/app.R
#COPY . /app

# Expose Shiny's default port
EXPOSE 3838  

# Set the command to run the Shiny app when the container starts
CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]
