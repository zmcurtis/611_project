This is my project for BIOS 611 Data Science. This analysis will explore a concatenated data set containing chemical components of red and white variants of the Portuguese "Vinho Verde" wine from 2009. I investigate how chemical components differ between red and white wines, and whether chemical composition can predict alcohol levels. 

The data is located at: https://archive.ics.uci.edu/dataset/186/wine+quality 

This project is organized as a Makefile-based workflow: running make once in the project directory will produce the final pdf report and all the plots produced. All packages are installed via the Dockerfile and the entire analysis can be run within the container. 

Download the Dockerfile and in the terminal cd to the directory where that lives. then run: 
"docker build -t rstudio611 ." 

when this finishes running type (with password of your choice: 
"docker run -d \
	-p 8787:8787 \
	-e PASSWORD=yourpassword \
	-v "$(pwd)":/home/rstudio/project \
	--name rstudio611 \
	rstudio611
" 

go to http://localhost:8787 
sign in with username "rstudio" and password set above 

Then within the container, go to the terminal tab and type "cd "project"" to go to be in the correct directory. Then type "make" to produce output. To remove generated plots, do "make clean". Stop the container with "docker stop rstudio611" and then "docker rm rstudio611". 

