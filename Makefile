# List of expected plot files
PLOTS = figures/density_plot.png \
	figures/corplot.png \
	figures/screeplot.png \
	figures/pcplot.png \
	figures/pcword.png \
	figures/qualityprop.png

# Source and output files
RMD_FILE = ZCurtis_611_Project.Rmd
REPORT = ZCurtis_611_project.pdf

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