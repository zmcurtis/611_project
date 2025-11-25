# List of expected plot files
PLOTS = figures/density_plot.png \
        figures/corplotall.png \
        figures/screeplot.png \
        figures/pcplot.png \
        figures/pcword.png \
        figures/qualityprop.png \
        figures/corplotred.png \
        figures/corplotwhite.png \
        figures/red.pcplot.png \
        figures/red.screeplot.png \
        figures/white.pcplot.png \
        figures/white.screeplot.png \
        figures/overlay_pcplot.png

# Source and output files
RMD_FILE = ZCurtis_611_Project.Rmd
REPORT = ZCurtis_611_Project.html

# Default target
all: $(PLOTS)

# Render the Rmd to generate the report AND the plots
$(REPORT): $(RMD_FILE) | figures
	Rscript -e "rmarkdown::render('$<')"

# Each plot depends on the report being up to date
$(PLOTS): $(REPORT)

# Ensure figures directory exists
figures:
	mkdir -p figures

# Optional: clean generated files
.PHONY: all clean

clean:
	rm -f $(PLOTS) $(REPORT)
	rm -rf *_files/  # removes knitr auto-generated folders (e.g., clustering_assignment_files/)