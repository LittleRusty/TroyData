# Use an official R runtime as a parent image
FROM rocker/rocker/shiny-verse:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Clone the Shiny app from GitHub
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/LittleRusty/TroyData.git .

# Install any needed packages specified in requirements.txt
RUN R -e "install.packages(c('shiny', 'dplyr', 'plotly'), repos='https://cran.rstudio.com/')"

# Make port 3838 available to the world outside this container
EXPOSE 3838

# Define environment variable
ENV NAME TroyData

# Run app.R when the container launches
CMD ["R", "-e", "shiny::runApp('/usr/src/treemap.R')"]
