{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "f12ea8db",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:35.360413Z",
     "iopub.status.busy": "2023-07-06T05:58:35.358792Z",
     "iopub.status.idle": "2023-07-06T05:58:36.314903Z",
     "shell.execute_reply": "2023-07-06T05:58:36.313576Z"
    },
    "papermill": {
     "duration": 0.971175,
     "end_time": "2023-07-06T05:58:36.317496",
     "exception": false,
     "start_time": "2023-07-06T05:58:35.346321",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'2022-q3'</li><li>'2022-q4'</li><li>'2023-q1'</li><li>'2023-q2'</li><li>'google-data-analytics-cyclistic-capstone-summary'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '2022-q3'\n",
       "\\item '2022-q4'\n",
       "\\item '2023-q1'\n",
       "\\item '2023-q2'\n",
       "\\item 'google-data-analytics-cyclistic-capstone-summary'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '2022-q3'\n",
       "2. '2022-q4'\n",
       "3. '2023-q1'\n",
       "4. '2023-q2'\n",
       "5. 'google-data-analytics-cyclistic-capstone-summary'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"2022-q3\"                                         \n",
       "[2] \"2022-q4\"                                         \n",
       "[3] \"2023-q1\"                                         \n",
       "[4] \"2023-q2\"                                         \n",
       "[5] \"google-data-analytics-cyclistic-capstone-summary\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8a91561a",
   "metadata": {
    "papermill": {
     "duration": 0.009017,
     "end_time": "2023-07-06T05:58:36.335433",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.326416",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Cyclistic Exercise Full Year Analysis**\n",
    "\n",
    "author: *Josue Valdez*\n",
    "\n",
    "date: *7/5/2023*\n",
    "\n",
    "This analysis focuses on case study 1 from the Google Data Analytics Certificate program, specifically centered around Cyclistic. The case study, titled \"'Sophisticated, Clear, and Polished’: Divvy and Data Visualization,\" was written by Kevin Hartman, and it can be found at this link: https://d3c33hcgiwev3.cloudfront.net/aacF81H_TsWnBfNR_x7FIg_36299b28fa0c4a5aba836111daad12f1_DAC8-Case-Study-1.pdf. Throughout this analysis, we will be utilizing the Divvy dataset to gain insights and draw conclusions. The aim is to provide a comprehensive examination of the case study, leveraging data visualization techniques to present the findings effectively. By adhering to the provided instructions, this document will offer a detailed analysis while maintaining a professional tone.\n",
    "\n",
    "Document Title: How Does a Bike-Share Navigate Speedy Success?\n",
    "\n",
    "Introduction:\n",
    "\n",
    "The purpose of this script is to consolidate downloaded Divvy data into a single dataframe and conduct a simple analysis to answer the key question: \"In what ways do members and casual riders use Divvy bikes differently?\" This analysis will provide insights into the usage patterns of Divvy bikes, distinguishing between members and casual riders. To perform this analysis, we will be using the R programming language and the following packages: tidyverse, lubridate, and ggplot. \n",
    "\n",
    "Data Import and Wrangling:\n",
    "\n",
    "To begin the analysis, we need to import and consolidate the Divvy data into a single dataframe. We will be using the tidyverse package, which provides a set of powerful tools for data import, manipulation, and visualization. The tidyverse package can be installed using the following code:\n",
    "\n",
    "```R\n",
    "\n",
    "install.packages(\"tidyverse\")\n",
    "\n",
    "```\n",
    "\n",
    "Next, we need to install the lubridate package, which provides functions for working with dates and times. This package will enable us to extract relevant information from the Divvy data, such as the day of the week or the hour of the day. The lubridate package can be installed using the following code:\n",
    "\n",
    "```R\n",
    "\n",
    "install.packages(\"lubridate\")\n",
    "\n",
    "```\n",
    "\n",
    "Finally, we need to install the ggplot package, which is a powerful data visualization package in R. We will be using ggplot to create visualizations that help us understand the differences in bike usage between members and casual riders. The ggplot package can be installed with the following code:\n",
    "\n",
    "```R\n",
    "\n",
    "install.packages(\"ggplot2\")\n",
    "\n",
    "```\n",
    "\n",
    "Once we have installed the required packages, we can proceed with importing and wrangling the Divvy data. The specific steps for this process may vary depending on the format and structure of the downloaded data. However, the tidyverse package provides a set of functions that can handle a wide range of data formats. By using functions like `read_csv()` and `mutate()`, we can import and transform the data into a suitable format for analysis.\n",
    "\n",
    "Analysis:\n",
    "\n",
    "With the consolidated dataframe in place, we can now proceed with the analysis of Divvy bike usage patterns. Our primary focus is to compare the usage patterns between members and casual riders.\n",
    "\n",
    "To compare the usage patterns, we can generate various visualizations using ggplot. For example, we can create a bar chart to compare the number of rides taken by members and casual riders on different days of the week. This visualization will help us identify any differences in bike usage patterns based on the day of the week.\n",
    "\n",
    "Another visualization that can provide insights is a line chart showing the average ride duration for members and casual riders over time. This visualization will help us understand if there are any trends or patterns in ride durations based on membership type.\n",
    "\n",
    "Additionally, we can also analyze the average ride distance for members and casual riders and compare them using a boxplot. This visualization will provide a clear comparison of the distribution of ride distances between the two groups.\n",
    "\n",
    "Conclusion:\n",
    "\n",
    "By analyzing the consolidated Divvy data, we can gain valuable insights into the ways in which members and casual riders use Divvy bikes differently. Through the installation of the tidyverse, lubridate, and ggplot packages, we can import, wrangle, and visualize the data effectively. The analysis will provide visualizations that help answer the key question and shed light on the usage patterns of Divvy bikes among members and casual riders."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9ab92464",
   "metadata": {
    "papermill": {
     "duration": 0.008277,
     "end_time": "2023-07-06T05:58:36.352028",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.343751",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Scenario**\n",
    "\n",
    "You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director\n",
    "of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,\n",
    "your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,\n",
    "your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives\n",
    "must approve your recommendations, so they must be backed up with compelling data insights and professional data\n",
    "visualizations."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f8fd210d",
   "metadata": {
    "papermill": {
     "duration": 0.008146,
     "end_time": "2023-07-06T05:58:36.368451",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.360305",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Business Objective**\n",
    "* What is the problem?\n",
    "* How do annual members and casual riders use Cyclistic bikes differently?\n",
    "* Why would casual riders buy Cyclistic annual memberships?\n",
    "* How can Cyclists use digital media to influence casual riders to become members?\n",
    "* How can your insights drive business decisions?\n",
    "* If we know how casual riders differ from annual members, we can develop a strategy to target casual riders and convert them into annual members. ## Stakeholders include:\n",
    "    *     Cyclistic executive team\n",
    "    *     Lily Moreno (fictional supervisor)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "47605796",
   "metadata": {
    "papermill": {
     "duration": 0.008169,
     "end_time": "2023-07-06T05:58:36.384862",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.376693",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# Data**\n",
    "\n",
    "The data for the analysis processes has been securely stored on an AWS server, ensuring easy accessibility and correct naming conventions. To proceed with the analysis, I have downloaded the data for the previous 12 months and stored it locally. The data is thoughtfully organized by year and Fiscal Quarters, facilitating a systematic approach to the analysis.\n",
    "\n",
    "One of the key aspects of this data is its reliability and originality, as it originates directly from the company. This ensures that the information is trustworthy and accurately represents the company's operations. To further enhance its value, the data is comprehensive, providing a holistic view of the relevant metrics and variables. \n",
    "\n",
    "Moreover, it is important to note that the data is current, reflecting the most recent information available. This ensures that any analysis or insights derived from the data are up-to-date and relevant. To maintain transparency and integrity, all sources have been properly cited, acknowledging the origin of the data and any external references used in the analysis.\n",
    "\n",
    "In summary, the data for the analysis processes is securely stored on an AWS server, easily downloadable, and named correctly. It has been downloaded for the previous 12 months and stored locally, organized by year and Fiscal Quarters. The data is reliable, original, comprehensive, current, and properly cited, making it a valuable resource for further analysis."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d1188d8a",
   "metadata": {
    "papermill": {
     "duration": 0.008102,
     "end_time": "2023-07-06T05:58:36.401219",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.393117",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# Process**\n",
    "\n",
    "The data analysis process often involves using a combination of different tools to ensure accurate results. In this case, two widely used tools, Excel and R Studio, have been employed to handle the data from the company. These tools are known for their reliability and versatility in data analysis tasks.\n",
    "\n",
    "In order to ensure the integrity and trustworthiness of the data, R Studio has been utilized to create a markdown report. This report serves as a documentation of the data cleaning process, where careful steps have been taken to ensure that the data is clean and adheres to consistent standards.\n",
    "\n",
    "One of the key steps in the data cleaning process involved renaming incorrect columns. This ensures that the data is labeled accurately, allowing for easier analysis and interpretation. By eliminating unnecessary columns, the dataset becomes more streamlined and focused, thus reducing any potential confusion or noise in the analysis.\n",
    "\n",
    "By utilizing the features and functionalities of both Excel and R Studio, the data has been thoroughly examined and processed to ensure its quality and reliability. This rigorous approach to data analysis helps in making informed decisions and drawing accurate conclusions based on the data at hand."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "2d491209",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:36.444054Z",
     "iopub.status.busy": "2023-07-06T05:58:36.419528Z",
     "iopub.status.idle": "2023-07-06T05:58:36.453709Z",
     "shell.execute_reply": "2023-07-06T05:58:36.452443Z"
    },
    "papermill": {
     "duration": 0.046737,
     "end_time": "2023-07-06T05:58:36.456131",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.409394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "540dd0a5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:36.475992Z",
     "iopub.status.busy": "2023-07-06T05:58:36.474804Z",
     "iopub.status.idle": "2023-07-06T05:58:36.485626Z",
     "shell.execute_reply": "2023-07-06T05:58:36.484401Z"
    },
    "papermill": {
     "duration": 0.02295,
     "end_time": "2023-07-06T05:58:36.487986",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.465036",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "85226131",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:36.508404Z",
     "iopub.status.busy": "2023-07-06T05:58:36.507183Z",
     "iopub.status.idle": "2023-07-06T05:58:36.518754Z",
     "shell.execute_reply": "2023-07-06T05:58:36.517502Z"
    },
    "papermill": {
     "duration": 0.024816,
     "end_time": "2023-07-06T05:58:36.521059",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.496243",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "7c54cc44",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:36.540980Z",
     "iopub.status.busy": "2023-07-06T05:58:36.539718Z",
     "iopub.status.idle": "2023-07-06T05:58:36.559148Z",
     "shell.execute_reply": "2023-07-06T05:58:36.557933Z"
    },
    "papermill": {
     "duration": 0.031409,
     "end_time": "2023-07-06T05:58:36.561142",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.529733",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'/kaggle/working'"
      ],
      "text/latex": [
       "'/kaggle/working'"
      ],
      "text/markdown": [
       "'/kaggle/working'"
      ],
      "text/plain": [
       "[1] \"/kaggle/working\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "getwd()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "34671764",
   "metadata": {
    "papermill": {
     "duration": 0.008162,
     "end_time": "2023-07-06T05:58:36.578263",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.570101",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# ****# Analyze****"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a7d1e9ea",
   "metadata": {
    "papermill": {
     "duration": 0.008422,
     "end_time": "2023-07-06T05:58:36.594857",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.586435",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# STEP 1: COLLECT DATA"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "785fb1ea",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:36.615671Z",
     "iopub.status.busy": "2023-07-06T05:58:36.614268Z",
     "iopub.status.idle": "2023-07-06T05:58:46.172991Z",
     "shell.execute_reply": "2023-07-06T05:58:46.171379Z"
    },
    "papermill": {
     "duration": 9.571614,
     "end_time": "2023-07-06T05:58:46.175604",
     "exception": false,
     "start_time": "2023-07-06T05:58:36.603990",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mOne or more parsing issues, call `problems()` on your data frame for details,\n",
      "e.g.:\n",
      "  dat <- vroom(...)\n",
      "  problems(dat)”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m2378626\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q3_2022 <- read_csv(\"/kaggle/input/2022-q3/2022_q3.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "5a5719b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:46.195870Z",
     "iopub.status.busy": "2023-07-06T05:58:46.194703Z",
     "iopub.status.idle": "2023-07-06T05:58:54.522637Z",
     "shell.execute_reply": "2023-07-06T05:58:54.521159Z"
    },
    "papermill": {
     "duration": 8.340136,
     "end_time": "2023-07-06T05:58:54.524564",
     "exception": false,
     "start_time": "2023-07-06T05:58:46.184428",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mOne or more parsing issues, call `problems()` on your data frame for details,\n",
      "e.g.:\n",
      "  dat <- vroom(...)\n",
      "  problems(dat)”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m1597761\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q4_2022 <- read_csv(\"/kaggle/input/2022-q4/2022_q4.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6d0101c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:54.544760Z",
     "iopub.status.busy": "2023-07-06T05:58:54.543633Z",
     "iopub.status.idle": "2023-07-06T05:58:55.926229Z",
     "shell.execute_reply": "2023-07-06T05:58:55.924839Z"
    },
    "papermill": {
     "duration": 1.394559,
     "end_time": "2023-07-06T05:58:55.928072",
     "exception": false,
     "start_time": "2023-07-06T05:58:54.533513",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mOne or more parsing issues, call `problems()` on your data frame for details,\n",
      "e.g.:\n",
      "  dat <- vroom(...)\n",
      "  problems(dat)”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m562554\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q1_2023 <- read_csv(\"/kaggle/input/2023-q1/2023_q1.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "17fc81ee",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2023-07-06T05:58:55.950130Z",
     "iopub.status.busy": "2023-07-06T05:58:55.948971Z",
     "iopub.status.idle": "2023-07-06T05:59:01.523860Z",
     "shell.execute_reply": "2023-07-06T05:59:01.522255Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 5.587672,
     "end_time": "2023-07-06T05:59:01.525871",
     "exception": false,
     "start_time": "2023-07-06T05:58:55.938199",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mOne or more parsing issues, call `problems()` on your data frame for details,\n",
      "e.g.:\n",
      "  dat <- vroom(...)\n",
      "  problems(dat)”\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m1290097\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "q2_2023 <- read_csv(\"/kaggle/input/2023-q2/2023_q2.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9e82ff6c",
   "metadata": {
    "papermill": {
     "duration": 0.009527,
     "end_time": "2023-07-06T05:59:01.545231",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.535704",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE**\n",
    "\n",
    "Compare column names each of the files\n",
    "\n",
    "While the names don't have to be in the same order, they DO need to match perfectly before we can use a command to join them into one file\n",
    "Compare column names each of the files\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "42b5d313",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:01.567291Z",
     "iopub.status.busy": "2023-07-06T05:59:01.565939Z",
     "iopub.status.idle": "2023-07-06T05:59:01.592568Z",
     "shell.execute_reply": "2023-07-06T05:59:01.591337Z"
    },
    "papermill": {
     "duration": 0.039491,
     "end_time": "2023-07-06T05:59:01.594306",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.554815",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(q3_2022)\n",
    "colnames(q4_2022)\n",
    "colnames(q1_2023)\n",
    "colnames(q2_2023)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f01f22ee",
   "metadata": {
    "papermill": {
     "duration": 0.009766,
     "end_time": "2023-07-06T05:59:01.614247",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.604481",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Inspect the dataframes and look for incongruencies"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "eb5db21d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:01.638134Z",
     "iopub.status.busy": "2023-07-06T05:59:01.636703Z",
     "iopub.status.idle": "2023-07-06T05:59:01.749233Z",
     "shell.execute_reply": "2023-07-06T05:59:01.747552Z"
    },
    "papermill": {
     "duration": 0.126691,
     "end_time": "2023-07-06T05:59:01.751154",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.624463",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [2,378,626 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:2378626] \"600CFD130D0FD2A4\" \"F5E6B5C1682C6464\" \"B6EB6D27BAD771D2\" \"C9C320375DE1D5C6\" ...\n",
      " $ rideable_type     : chr [1:2378626] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct[1:2378626], format: \"2022-06-30 17:27:53\" \"2022-06-30 18:39:52\" ...\n",
      " $ ended_at          : POSIXct[1:2378626], format: \"2022-06-30 17:35:15\" \"2022-06-30 18:47:28\" ...\n",
      " $ start_station_name: chr [1:2378626] NA NA NA NA ...\n",
      " $ start_station_id  : chr [1:2378626] NA NA NA NA ...\n",
      " $ end_station_name  : chr [1:2378626] NA NA NA NA ...\n",
      " $ end_station_id    : chr [1:2378626] NA NA NA NA ...\n",
      " $ start_lat         : num [1:2378626] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num [1:2378626] -87.6 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num [1:2378626] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num [1:2378626] -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr [1:2378626] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [1,597,761 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:1597761] \"5156990AC19CA285\" \"E12D4A16BF51C274\" \"A02B53CD7DB72DD7\" \"C82E05FEE872DF11\" ...\n",
      " $ rideable_type     : chr [1:1597761] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct[1:1597761], format: \"2022-09-01 08:36:22\" \"2022-09-01 17:11:29\" ...\n",
      " $ ended_at          : POSIXct[1:1597761], format: \"2022-09-01 08:39:05\" \"2022-09-01 17:14:45\" ...\n",
      " $ start_station_name: chr [1:1597761] NA NA NA NA ...\n",
      " $ start_station_id  : chr [1:1597761] NA NA NA NA ...\n",
      " $ end_station_name  : chr [1:1597761] \"California Ave & Milwaukee Ave\" NA NA NA ...\n",
      " $ end_station_id    : chr [1:1597761] \"13084\" NA NA NA ...\n",
      " $ start_lat         : num [1:1597761] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:1597761] -87.7 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ end_lat           : num [1:1597761] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:1597761] -87.7 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr [1:1597761] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [562,554 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:562554] \"65DBD2F447EC51C2\" \"0C201AA7EA0EA1AD\" \"E0B148CCB358A49D\" \"54C5775D2B7C9188\" ...\n",
      " $ rideable_type     : chr [1:562554] \"electric_bike\" \"classic_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:562554], format: \"2022-12-05 10:47:18\" \"2022-12-18 06:42:33\" ...\n",
      " $ ended_at          : POSIXct[1:562554], format: \"2022-12-05 10:56:34\" \"2022-12-18 07:08:44\" ...\n",
      " $ start_station_name: chr [1:562554] \"Clifton Ave & Armitage Ave\" \"Broadway & Belmont Ave\" \"Sangamon St & Lake St\" \"Shields Ave & 31st St\" ...\n",
      " $ start_station_id  : chr [1:562554] \"TA1307000163\" \"13277\" \"TA1306000015\" \"KA1503000038\" ...\n",
      " $ end_station_name  : chr [1:562554] \"Sedgwick St & Webster Ave\" \"Sedgwick St & Webster Ave\" \"St. Clair St & Erie St\" \"Damen Ave & Madison St\" ...\n",
      " $ end_station_id    : chr [1:562554] \"13191\" \"13191\" \"13016\" \"13134\" ...\n",
      " $ start_lat         : num [1:562554] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num [1:562554] -87.7 -87.6 -87.7 -87.6 -87.7 ...\n",
      " $ end_lat           : num [1:562554] 41.9 41.9 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:562554] -87.6 -87.6 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr [1:562554] \"member\" \"casual\" \"member\" \"member\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n",
      "spc_tbl_ [1,290,097 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:1290097] \"6842AA605EE9FBB3\" \"F984267A75B99A8C\" \"FF7CF57CFE026D02\" \"6B61B916032CB6D6\" ...\n",
      " $ rideable_type     : chr [1:1290097] \"electric_bike\" \"electric_bike\" \"classic_bike\" \"classic_bike\" ...\n",
      " $ started_at        : POSIXct[1:1290097], format: \"2023-03-16 08:20:34\" \"2023-03-04 14:07:06\" ...\n",
      " $ ended_at          : POSIXct[1:1290097], format: \"2023-03-16 08:22:52\" \"2023-03-04 14:15:31\" ...\n",
      " $ start_station_name: chr [1:1290097] \"Clark St & Armitage Ave\" \"Public Rack - Kedzie Ave & Argyle St\" \"Orleans St & Chestnut St (NEXT Apts)\" \"Desplaines St & Kinzie St\" ...\n",
      " $ start_station_id  : chr [1:1290097] \"13146\" \"491\" \"620\" \"TA1306000003\" ...\n",
      " $ end_station_name  : chr [1:1290097] \"Larrabee St & Webster Ave\" NA \"Clark St & Randolph St\" \"Sheffield Ave & Kingsbury St\" ...\n",
      " $ end_station_id    : chr [1:1290097] \"13193\" NA \"TA1305000030\" \"13154\" ...\n",
      " $ start_lat         : num [1:1290097] 41.9 42 41.9 41.9 41.9 ...\n",
      " $ start_lng         : num [1:1290097] -87.6 -87.7 -87.6 -87.6 -87.7 ...\n",
      " $ end_lat           : num [1:1290097] 41.9 42 41.9 41.9 41.9 ...\n",
      " $ end_lng           : num [1:1290097] -87.6 -87.7 -87.6 -87.7 -87.7 ...\n",
      " $ member_casual     : chr [1:1290097] \"member\" \"member\" \"member\" \"member\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(q3_2022)\n",
    "str(q4_2022)\n",
    "str(q1_2023)\n",
    "str(q2_2023)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6d70d71f",
   "metadata": {
    "papermill": {
     "duration": 0.010128,
     "end_time": "2023-07-06T05:59:01.771819",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.761691",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Stack individual quarter's data frames into one big data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "800cdf8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:01.795099Z",
     "iopub.status.busy": "2023-07-06T05:59:01.793735Z",
     "iopub.status.idle": "2023-07-06T05:59:06.798075Z",
     "shell.execute_reply": "2023-07-06T05:59:06.796575Z"
    },
    "papermill": {
     "duration": 5.018189,
     "end_time": "2023-07-06T05:59:06.800178",
     "exception": false,
     "start_time": "2023-07-06T05:59:01.781989",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips <- bind_rows(q3_2022, q4_2022, q1_2023, q2_2023)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da533bcb",
   "metadata": {
    "papermill": {
     "duration": 0.011078,
     "end_time": "2023-07-06T05:59:06.822624",
     "exception": false,
     "start_time": "2023-07-06T05:59:06.811546",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS**\n",
    "\n",
    "Inspect the new table that has been created"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "9c28fab2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:06.846894Z",
     "iopub.status.busy": "2023-07-06T05:59:06.845519Z",
     "iopub.status.idle": "2023-07-06T05:59:10.092692Z",
     "shell.execute_reply": "2023-07-06T05:59:10.091480Z"
    },
    "papermill": {
     "duration": 3.261262,
     "end_time": "2023-07-06T05:59:10.094497",
     "exception": false,
     "start_time": "2023-07-06T05:59:06.833235",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "5829038"
      ],
      "text/latex": [
       "5829038"
      ],
      "text/markdown": [
       "5829038"
      ],
      "text/plain": [
       "[1] 5829038"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5829038</li><li>13</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5829038\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5829038\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5829038      13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>600CFD130D0FD2A4</td><td>electric_bike</td><td>2022-06-30 17:27:53</td><td>2022-06-30 17:35:15</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.89</td><td>-87.62</td><td>41.91</td><td>-87.62</td><td>casual</td></tr>\n",
       "\t<tr><td>F5E6B5C1682C6464</td><td>electric_bike</td><td>2022-06-30 18:39:52</td><td>2022-06-30 18:47:28</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.91</td><td>-87.62</td><td>41.93</td><td>-87.63</td><td>casual</td></tr>\n",
       "\t<tr><td>B6EB6D27BAD771D2</td><td>electric_bike</td><td>2022-06-30 11:49:25</td><td>2022-06-30 12:02:54</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.91</td><td>-87.65</td><td>41.89</td><td>-87.61</td><td>casual</td></tr>\n",
       "\t<tr><td>C9C320375DE1D5C6</td><td>electric_bike</td><td>2022-06-30 11:15:25</td><td>2022-06-30 11:19:43</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.80</td><td>-87.66</td><td>41.80</td><td>-87.65</td><td>casual</td></tr>\n",
       "\t<tr><td>56C055851023BE98</td><td>electric_bike</td><td>2022-06-29 23:36:50</td><td>2022-06-29 23:45:17</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>41.91</td><td>-87.63</td><td>41.93</td><td>-87.64</td><td>casual</td></tr>\n",
       "\t<tr><td>B664188E8163D045</td><td>electric_bike</td><td>2022-06-30 16:42:10</td><td>2022-06-30 16:58:22</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>42.03</td><td>-87.71</td><td>42.06</td><td>-87.73</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 13\n",
       "\\begin{tabular}{lllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 600CFD130D0FD2A4 & electric\\_bike & 2022-06-30 17:27:53 & 2022-06-30 17:35:15 & NA & NA & NA & NA & 41.89 & -87.62 & 41.91 & -87.62 & casual\\\\\n",
       "\t F5E6B5C1682C6464 & electric\\_bike & 2022-06-30 18:39:52 & 2022-06-30 18:47:28 & NA & NA & NA & NA & 41.91 & -87.62 & 41.93 & -87.63 & casual\\\\\n",
       "\t B6EB6D27BAD771D2 & electric\\_bike & 2022-06-30 11:49:25 & 2022-06-30 12:02:54 & NA & NA & NA & NA & 41.91 & -87.65 & 41.89 & -87.61 & casual\\\\\n",
       "\t C9C320375DE1D5C6 & electric\\_bike & 2022-06-30 11:15:25 & 2022-06-30 11:19:43 & NA & NA & NA & NA & 41.80 & -87.66 & 41.80 & -87.65 & casual\\\\\n",
       "\t 56C055851023BE98 & electric\\_bike & 2022-06-29 23:36:50 & 2022-06-29 23:45:17 & NA & NA & NA & NA & 41.91 & -87.63 & 41.93 & -87.64 & casual\\\\\n",
       "\t B664188E8163D045 & electric\\_bike & 2022-06-30 16:42:10 & 2022-06-30 16:58:22 & NA & NA & NA & NA & 42.03 & -87.71 & 42.06 & -87.73 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 13\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 600CFD130D0FD2A4 | electric_bike | 2022-06-30 17:27:53 | 2022-06-30 17:35:15 | NA | NA | NA | NA | 41.89 | -87.62 | 41.91 | -87.62 | casual |\n",
       "| F5E6B5C1682C6464 | electric_bike | 2022-06-30 18:39:52 | 2022-06-30 18:47:28 | NA | NA | NA | NA | 41.91 | -87.62 | 41.93 | -87.63 | casual |\n",
       "| B6EB6D27BAD771D2 | electric_bike | 2022-06-30 11:49:25 | 2022-06-30 12:02:54 | NA | NA | NA | NA | 41.91 | -87.65 | 41.89 | -87.61 | casual |\n",
       "| C9C320375DE1D5C6 | electric_bike | 2022-06-30 11:15:25 | 2022-06-30 11:19:43 | NA | NA | NA | NA | 41.80 | -87.66 | 41.80 | -87.65 | casual |\n",
       "| 56C055851023BE98 | electric_bike | 2022-06-29 23:36:50 | 2022-06-29 23:45:17 | NA | NA | NA | NA | 41.91 | -87.63 | 41.93 | -87.64 | casual |\n",
       "| B664188E8163D045 | electric_bike | 2022-06-30 16:42:10 | 2022-06-30 16:58:22 | NA | NA | NA | NA | 42.03 | -87.71 | 42.06 | -87.73 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 600CFD130D0FD2A4 electric_bike 2022-06-30 17:27:53 2022-06-30 17:35:15\n",
       "2 F5E6B5C1682C6464 electric_bike 2022-06-30 18:39:52 2022-06-30 18:47:28\n",
       "3 B6EB6D27BAD771D2 electric_bike 2022-06-30 11:49:25 2022-06-30 12:02:54\n",
       "4 C9C320375DE1D5C6 electric_bike 2022-06-30 11:15:25 2022-06-30 11:19:43\n",
       "5 56C055851023BE98 electric_bike 2022-06-29 23:36:50 2022-06-29 23:45:17\n",
       "6 B664188E8163D045 electric_bike 2022-06-30 16:42:10 2022-06-30 16:58:22\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1 NA                 NA               NA               NA             41.89    \n",
       "2 NA                 NA               NA               NA             41.91    \n",
       "3 NA                 NA               NA               NA             41.91    \n",
       "4 NA                 NA               NA               NA             41.80    \n",
       "5 NA                 NA               NA               NA             41.91    \n",
       "6 NA                 NA               NA               NA             42.03    \n",
       "  start_lng end_lat end_lng member_casual\n",
       "1 -87.62    41.91   -87.62  casual       \n",
       "2 -87.62    41.93   -87.63  casual       \n",
       "3 -87.65    41.89   -87.61  casual       \n",
       "4 -87.66    41.80   -87.65  casual       \n",
       "5 -87.63    41.93   -87.64  casual       \n",
       "6 -87.71    42.06   -87.73  casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [5,829,038 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:5829038] \"600CFD130D0FD2A4\" \"F5E6B5C1682C6464\" \"B6EB6D27BAD771D2\" \"C9C320375DE1D5C6\" ...\n",
      " $ rideable_type     : chr [1:5829038] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct[1:5829038], format: \"2022-06-30 17:27:53\" \"2022-06-30 18:39:52\" ...\n",
      " $ ended_at          : POSIXct[1:5829038], format: \"2022-06-30 17:35:15\" \"2022-06-30 18:47:28\" ...\n",
      " $ start_station_name: chr [1:5829038] NA NA NA NA ...\n",
      " $ start_station_id  : chr [1:5829038] NA NA NA NA ...\n",
      " $ end_station_name  : chr [1:5829038] NA NA NA NA ...\n",
      " $ end_station_id    : chr [1:5829038] NA NA NA NA ...\n",
      " $ start_lat         : num [1:5829038] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num [1:5829038] -87.6 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num [1:5829038] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num [1:5829038] -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr [1:5829038] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5829038     Length:5829038     Min.   :2022-06-01 00:00:04  \n",
       " Class :character   Class :character   1st Qu.:2022-07-27 14:54:51  \n",
       " Mode  :character   Mode  :character   Median :2022-09-23 07:56:12  \n",
       "                                       Mean   :2022-10-28 01:02:13  \n",
       "                                       3rd Qu.:2023-02-05 15:35:06  \n",
       "                                       Max.   :2023-05-31 23:59:58  \n",
       "                                       NA's   :8                    \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2022-06-01 00:02:38   Length:5829038     Length:5829038    \n",
       " 1st Qu.:2022-07-27 15:16:15   Class :character   Class :character  \n",
       " Median :2022-09-23 08:14:32   Mode  :character   Mode  :character  \n",
       " Mean   :2022-10-28 01:20:55                                        \n",
       " 3rd Qu.:2023-02-05 15:50:20                                        \n",
       " Max.   :2023-06-07 23:04:26                                        \n",
       " NA's   :8                                                          \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:5829038     Length:5829038     Min.   :41.64   Min.   :-87.87  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :42.07   Max.   :-87.52  \n",
       "                                       NA's   :8       NA's   :8       \n",
       "    end_lat         end_lng       member_casual     \n",
       " Min.   : 0.00   Min.   :-88.11   Length:5829038    \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character  \n",
       " Median :41.90   Median :-87.64   Mode  :character  \n",
       " Mean   :41.90   Mean   :-87.65                     \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                     \n",
       " Max.   :42.37   Max.   :  0.00                     \n",
       " NA's   :5969    NA's   :5969                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(all_trips)  #List of column names\n",
    "nrow(all_trips)  #How many rows are in data frame?\n",
    "dim(all_trips)  #Dimensions of the data frame?\n",
    "head(all_trips)  #See the first 6 rows of data frame.  Also tail(qs_raw)\n",
    "str(all_trips)  #See list of columns and data types (numeric, character, etc)\n",
    "summary(all_trips)  #Statistical summary of data. Mainly for numerics"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2b2fca8",
   "metadata": {
    "papermill": {
     "duration": 0.010949,
     "end_time": "2023-07-06T05:59:10.116820",
     "exception": false,
     "start_time": "2023-07-06T05:59:10.105871",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**There are a few problems we will need to fix:**\n",
    "\n",
    "(1) The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data -- such as day, month, year -- that provide additional opportunities to aggregate the data.\n",
    "(2) We will add \"ride_length\" to the entire dataframe for consistency.\n",
    "(3) There are some rides where tripduration shows up as negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2877177c",
   "metadata": {
    "papermill": {
     "duration": 0.011911,
     "end_time": "2023-07-06T05:59:10.166206",
     "exception": false,
     "start_time": "2023-07-06T05:59:10.154295",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Add columns that list the date, month, day, and year of each ride\n",
    "This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "e32bbb13",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:10.191859Z",
     "iopub.status.busy": "2023-07-06T05:59:10.190712Z",
     "iopub.status.idle": "2023-07-06T05:59:17.022519Z",
     "shell.execute_reply": "2023-07-06T05:59:17.021066Z"
    },
    "papermill": {
     "duration": 6.846553,
     "end_time": "2023-07-06T05:59:17.024536",
     "exception": false,
     "start_time": "2023-07-06T05:59:10.177983",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$date <- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd\n",
    "all_trips$month <- format(as.Date(all_trips$date), \"%m\")\n",
    "all_trips$day <- format(as.Date(all_trips$date), \"%d\")\n",
    "all_trips$year <- format(as.Date(all_trips$date), \"%Y\")\n",
    "all_trips$day_of_week <- format(as.Date(all_trips$date), \"%A\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "72c7e356",
   "metadata": {
    "papermill": {
     "duration": 0.011235,
     "end_time": "2023-07-06T05:59:17.047264",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.036029",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Add a \"ride_length\" calculation to all_trips (in seconds)**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "2112305c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:17.072545Z",
     "iopub.status.busy": "2023-07-06T05:59:17.071218Z",
     "iopub.status.idle": "2023-07-06T05:59:17.104002Z",
     "shell.execute_reply": "2023-07-06T05:59:17.102557Z"
    },
    "papermill": {
     "duration": 0.048009,
     "end_time": "2023-07-06T05:59:17.106303",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.058294",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4da6207c",
   "metadata": {
    "papermill": {
     "duration": 0.011154,
     "end_time": "2023-07-06T05:59:17.128979",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.117825",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Inspect the structure of the columns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "666e5fed",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:17.154617Z",
     "iopub.status.busy": "2023-07-06T05:59:17.153367Z",
     "iopub.status.idle": "2023-07-06T05:59:17.189301Z",
     "shell.execute_reply": "2023-07-06T05:59:17.188057Z"
    },
    "papermill": {
     "duration": 0.050624,
     "end_time": "2023-07-06T05:59:17.191018",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.140394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [5,829,038 × 19] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ ride_id           : chr [1:5829038] \"600CFD130D0FD2A4\" \"F5E6B5C1682C6464\" \"B6EB6D27BAD771D2\" \"C9C320375DE1D5C6\" ...\n",
      " $ rideable_type     : chr [1:5829038] \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct[1:5829038], format: \"2022-06-30 17:27:53\" \"2022-06-30 18:39:52\" ...\n",
      " $ ended_at          : POSIXct[1:5829038], format: \"2022-06-30 17:35:15\" \"2022-06-30 18:47:28\" ...\n",
      " $ start_station_name: chr [1:5829038] NA NA NA NA ...\n",
      " $ start_station_id  : chr [1:5829038] NA NA NA NA ...\n",
      " $ end_station_name  : chr [1:5829038] NA NA NA NA ...\n",
      " $ end_station_id    : chr [1:5829038] NA NA NA NA ...\n",
      " $ start_lat         : num [1:5829038] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ start_lng         : num [1:5829038] -87.6 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num [1:5829038] 41.9 41.9 41.9 41.8 41.9 ...\n",
      " $ end_lng           : num [1:5829038] -87.6 -87.6 -87.6 -87.7 -87.6 ...\n",
      " $ member_casual     : chr [1:5829038] \"casual\" \"casual\" \"casual\" \"casual\" ...\n",
      " $ date              : Date[1:5829038], format: \"2022-06-30\" \"2022-06-30\" ...\n",
      " $ month             : chr [1:5829038] \"06\" \"06\" \"06\" \"06\" ...\n",
      " $ day               : chr [1:5829038] \"30\" \"30\" \"30\" \"30\" ...\n",
      " $ year              : chr [1:5829038] \"2022\" \"2022\" \"2022\" \"2022\" ...\n",
      " $ day_of_week       : chr [1:5829038] \"Thursday\" \"Thursday\" \"Thursday\" \"Thursday\" ...\n",
      " $ ride_length       : 'difftime' num [1:5829038] 442 456 809 258 ...\n",
      "  ..- attr(*, \"units\")= chr \"secs\"\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   ride_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   rideable_type = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   started_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   ended_at = \u001b[34mcol_datetime(format = \"\")\u001b[39m,\n",
      "  ..   start_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_name = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   end_station_id = \u001b[31mcol_character()\u001b[39m,\n",
      "  ..   start_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   start_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lat = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   end_lng = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   member_casual = \u001b[31mcol_character()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(all_trips)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "36f36a0c",
   "metadata": {
    "papermill": {
     "duration": 0.010997,
     "end_time": "2023-07-06T05:59:17.213540",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.202543",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Convert \"ride_length\" from Factor to numeric so we can run calculations on the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "8dad0abc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:17.239749Z",
     "iopub.status.busy": "2023-07-06T05:59:17.238530Z",
     "iopub.status.idle": "2023-07-06T05:59:22.317234Z",
     "shell.execute_reply": "2023-07-06T05:59:22.315986Z"
    },
    "papermill": {
     "duration": 5.094598,
     "end_time": "2023-07-06T05:59:22.319181",
     "exception": false,
     "start_time": "2023-07-06T05:59:17.224583",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.factor(all_trips$ride_length)\n",
    "all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))\n",
    "is.numeric(all_trips$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2c066bd3",
   "metadata": {
    "papermill": {
     "duration": 0.012303,
     "end_time": "2023-07-06T05:59:22.343936",
     "exception": false,
     "start_time": "2023-07-06T05:59:22.331633",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Remove \"bad\" data\n",
    "\n",
    "The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative\n",
    "\n",
    "We will create a new version of the dataframe (v2) since data is being removed"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "8b3c4e9d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:22.369596Z",
     "iopub.status.busy": "2023-07-06T05:59:22.368350Z",
     "iopub.status.idle": "2023-07-06T05:59:24.873302Z",
     "shell.execute_reply": "2023-07-06T05:59:24.871838Z"
    },
    "papermill": {
     "duration": 2.519626,
     "end_time": "2023-07-06T05:59:24.874903",
     "exception": false,
     "start_time": "2023-07-06T05:59:22.355277",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "all_trips_v2 <- all_trips[!(is.na(all_trips$ride_length) | is.na(all_trips$day_of_week) | all_trips$ride_length<=0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cb4e405e",
   "metadata": {
    "papermill": {
     "duration": 0.011001,
     "end_time": "2023-07-06T05:59:24.897341",
     "exception": false,
     "start_time": "2023-07-06T05:59:24.886340",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# STEP 4: CONDUCT DESCRIPTIVE ANALYSIS\n",
    "\n",
    "Descriptive analysis on ride_length (all figures in seconds)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "104b40b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:24.922394Z",
     "iopub.status.busy": "2023-07-06T05:59:24.921189Z",
     "iopub.status.idle": "2023-07-06T05:59:25.265981Z",
     "shell.execute_reply": "2023-07-06T05:59:25.264648Z"
    },
    "papermill": {
     "duration": 0.359284,
     "end_time": "2023-07-06T05:59:25.267655",
     "exception": false,
     "start_time": "2023-07-06T05:59:24.908371",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n",
       "      1     335     591    1123    1057 2483235 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(all_trips_v2$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c8c69f43",
   "metadata": {
    "papermill": {
     "duration": 0.011515,
     "end_time": "2023-07-06T05:59:25.290681",
     "exception": false,
     "start_time": "2023-07-06T05:59:25.279166",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Compare members and casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "f73c73ac",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:25.316043Z",
     "iopub.status.busy": "2023-07-06T05:59:25.314842Z",
     "iopub.status.idle": "2023-07-06T05:59:38.884818Z",
     "shell.execute_reply": "2023-07-06T05:59:38.882876Z"
    },
    "papermill": {
     "duration": 13.585575,
     "end_time": "2023-07-06T05:59:38.887389",
     "exception": false,
     "start_time": "2023-07-06T05:59:25.301814",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1692.6998</td></tr>\n",
       "\t<tr><td>member</td><td> 748.2474</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1692.6998\\\\\n",
       "\t member &  748.2474\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1692.6998 |\n",
       "| member |  748.2474 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1692.6998               \n",
       "2 member                      748.2474               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>735</td></tr>\n",
       "\t<tr><td>member</td><td>517</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 735\\\\\n",
       "\t member & 517\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 735 |\n",
       "| member | 517 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     735                     \n",
       "2 member                     517                     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2483235</td></tr>\n",
       "\t<tr><td>member</td><td>  93580</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2483235\\\\\n",
       "\t member &   93580\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 2483235 |\n",
       "| member |   93580 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     2483235                 \n",
       "2 member                       93580                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1</td></tr>\n",
       "\t<tr><td>member</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 1\\\\\n",
       "\t member & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 1 |\n",
       "| member | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  all_trips_v2$member_casual all_trips_v2$ride_length\n",
       "1 casual                     1                       \n",
       "2 member                     1                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)\n",
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "55b84141",
   "metadata": {
    "papermill": {
     "duration": 0.012152,
     "end_time": "2023-07-06T05:59:38.912405",
     "exception": false,
     "start_time": "2023-07-06T05:59:38.900253",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "See the average ride time by each day for members vs casual users"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "11f7743a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:38.939174Z",
     "iopub.status.busy": "2023-07-06T05:59:38.937945Z",
     "iopub.status.idle": "2023-07-06T05:59:42.055582Z",
     "shell.execute_reply": "2023-07-06T05:59:42.053684Z"
    },
    "papermill": {
     "duration": 3.133802,
     "end_time": "2023-07-06T05:59:42.058128",
     "exception": false,
     "start_time": "2023-07-06T05:59:38.924326",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1641.7669</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 740.6443</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1653.5022</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 710.8147</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1924.8735</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 834.7959</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>2002.7362</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 830.9489</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1462.3344</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 722.0067</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1517.0445</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 718.9393</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1436.6346</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 714.8681</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1641.7669\\\\\n",
       "\t member & Friday    &  740.6443\\\\\n",
       "\t casual & Monday    & 1653.5022\\\\\n",
       "\t member & Monday    &  710.8147\\\\\n",
       "\t casual & Saturday  & 1924.8735\\\\\n",
       "\t member & Saturday  &  834.7959\\\\\n",
       "\t casual & Sunday    & 2002.7362\\\\\n",
       "\t member & Sunday    &  830.9489\\\\\n",
       "\t casual & Thursday  & 1462.3344\\\\\n",
       "\t member & Thursday  &  722.0067\\\\\n",
       "\t casual & Tuesday   & 1517.0445\\\\\n",
       "\t member & Tuesday   &  718.9393\\\\\n",
       "\t casual & Wednesday & 1436.6346\\\\\n",
       "\t member & Wednesday &  714.8681\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1641.7669 |\n",
       "| member | Friday    |  740.6443 |\n",
       "| casual | Monday    | 1653.5022 |\n",
       "| member | Monday    |  710.8147 |\n",
       "| casual | Saturday  | 1924.8735 |\n",
       "| member | Saturday  |  834.7959 |\n",
       "| casual | Sunday    | 2002.7362 |\n",
       "| member | Sunday    |  830.9489 |\n",
       "| casual | Thursday  | 1462.3344 |\n",
       "| member | Thursday  |  722.0067 |\n",
       "| casual | Tuesday   | 1517.0445 |\n",
       "| member | Tuesday   |  718.9393 |\n",
       "| casual | Wednesday | 1436.6346 |\n",
       "| member | Wednesday |  714.8681 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Friday                   1641.7669               \n",
       "2  member                     Friday                    740.6443               \n",
       "3  casual                     Monday                   1653.5022               \n",
       "4  member                     Monday                    710.8147               \n",
       "5  casual                     Saturday                 1924.8735               \n",
       "6  member                     Saturday                  834.7959               \n",
       "7  casual                     Sunday                   2002.7362               \n",
       "8  member                     Sunday                    830.9489               \n",
       "9  casual                     Thursday                 1462.3344               \n",
       "10 member                     Thursday                  722.0067               \n",
       "11 casual                     Tuesday                  1517.0445               \n",
       "12 member                     Tuesday                   718.9393               \n",
       "13 casual                     Wednesday                1436.6346               \n",
       "14 member                     Wednesday                 714.8681               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fee3baaf",
   "metadata": {
    "papermill": {
     "duration": 0.012462,
     "end_time": "2023-07-06T05:59:42.083135",
     "exception": false,
     "start_time": "2023-07-06T05:59:42.070673",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Notice that the days of the week are out of order. Let's fix that."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "31edb101",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:42.111555Z",
     "iopub.status.busy": "2023-07-06T05:59:42.110192Z",
     "iopub.status.idle": "2023-07-06T05:59:45.086785Z",
     "shell.execute_reply": "2023-07-06T05:59:45.084901Z"
    },
    "papermill": {
     "duration": 2.993505,
     "end_time": "2023-07-06T05:59:45.089255",
     "exception": false,
     "start_time": "2023-07-06T05:59:42.095750",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>all_trips_v2$member_casual</th><th scope=col>all_trips_v2$day_of_week</th><th scope=col>all_trips_v2$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1641.7669</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 740.6443</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1653.5022</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 710.8147</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1924.8735</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 834.7959</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>2002.7362</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 830.9489</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1462.3344</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 722.0067</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1517.0445</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 718.9393</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1436.6346</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 714.8681</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " all\\_trips\\_v2\\$member\\_casual & all\\_trips\\_v2\\$day\\_of\\_week & all\\_trips\\_v2\\$ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1641.7669\\\\\n",
       "\t member & Friday    &  740.6443\\\\\n",
       "\t casual & Monday    & 1653.5022\\\\\n",
       "\t member & Monday    &  710.8147\\\\\n",
       "\t casual & Saturday  & 1924.8735\\\\\n",
       "\t member & Saturday  &  834.7959\\\\\n",
       "\t casual & Sunday    & 2002.7362\\\\\n",
       "\t member & Sunday    &  830.9489\\\\\n",
       "\t casual & Thursday  & 1462.3344\\\\\n",
       "\t member & Thursday  &  722.0067\\\\\n",
       "\t casual & Tuesday   & 1517.0445\\\\\n",
       "\t member & Tuesday   &  718.9393\\\\\n",
       "\t casual & Wednesday & 1436.6346\\\\\n",
       "\t member & Wednesday &  714.8681\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| all_trips_v2$member_casual &lt;chr&gt; | all_trips_v2$day_of_week &lt;chr&gt; | all_trips_v2$ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1641.7669 |\n",
       "| member | Friday    |  740.6443 |\n",
       "| casual | Monday    | 1653.5022 |\n",
       "| member | Monday    |  710.8147 |\n",
       "| casual | Saturday  | 1924.8735 |\n",
       "| member | Saturday  |  834.7959 |\n",
       "| casual | Sunday    | 2002.7362 |\n",
       "| member | Sunday    |  830.9489 |\n",
       "| casual | Thursday  | 1462.3344 |\n",
       "| member | Thursday  |  722.0067 |\n",
       "| casual | Tuesday   | 1517.0445 |\n",
       "| member | Tuesday   |  718.9393 |\n",
       "| casual | Wednesday | 1436.6346 |\n",
       "| member | Wednesday |  714.8681 |\n",
       "\n"
      ],
      "text/plain": [
       "   all_trips_v2$member_casual all_trips_v2$day_of_week all_trips_v2$ride_length\n",
       "1  casual                     Friday                   1641.7669               \n",
       "2  member                     Friday                    740.6443               \n",
       "3  casual                     Monday                   1653.5022               \n",
       "4  member                     Monday                    710.8147               \n",
       "5  casual                     Saturday                 1924.8735               \n",
       "6  member                     Saturday                  834.7959               \n",
       "7  casual                     Sunday                   2002.7362               \n",
       "8  member                     Sunday                    830.9489               \n",
       "9  casual                     Thursday                 1462.3344               \n",
       "10 member                     Thursday                  722.0067               \n",
       "11 casual                     Tuesday                  1517.0445               \n",
       "12 member                     Tuesday                   718.9393               \n",
       "13 casual                     Wednesday                1436.6346               \n",
       "14 member                     Wednesday                 714.8681               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "343b24ac",
   "metadata": {
    "papermill": {
     "duration": 0.012629,
     "end_time": "2023-07-06T05:59:45.114524",
     "exception": false,
     "start_time": "2023-07-06T05:59:45.101895",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "analyze ridership data by type and weekday"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "e5074d44",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:45.143543Z",
     "iopub.status.busy": "2023-07-06T05:59:45.142255Z",
     "iopub.status.idle": "2023-07-06T05:59:49.837307Z",
     "shell.execute_reply": "2023-07-06T05:59:49.836155Z"
    },
    "papermill": {
     "duration": 4.71181,
     "end_time": "2023-07-06T05:59:49.839135",
     "exception": false,
     "start_time": "2023-07-06T05:59:45.127325",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>375582</td><td>2002.7362</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>257799</td><td>1653.5022</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>270936</td><td>1517.0445</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>291886</td><td>1436.6346</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>313310</td><td>1462.3344</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>346524</td><td>1641.7669</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>455777</td><td>1924.8735</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>394506</td><td> 830.9489</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>471362</td><td> 710.8147</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>552484</td><td> 718.9393</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>579298</td><td> 714.8681</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>564862</td><td> 722.0067</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>501423</td><td> 740.6443</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>452714</td><td> 834.7959</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 375582 & 2002.7362\\\\\n",
       "\t casual & Mon & 257799 & 1653.5022\\\\\n",
       "\t casual & Tue & 270936 & 1517.0445\\\\\n",
       "\t casual & Wed & 291886 & 1436.6346\\\\\n",
       "\t casual & Thu & 313310 & 1462.3344\\\\\n",
       "\t casual & Fri & 346524 & 1641.7669\\\\\n",
       "\t casual & Sat & 455777 & 1924.8735\\\\\n",
       "\t member & Sun & 394506 &  830.9489\\\\\n",
       "\t member & Mon & 471362 &  710.8147\\\\\n",
       "\t member & Tue & 552484 &  718.9393\\\\\n",
       "\t member & Wed & 579298 &  714.8681\\\\\n",
       "\t member & Thu & 564862 &  722.0067\\\\\n",
       "\t member & Fri & 501423 &  740.6443\\\\\n",
       "\t member & Sat & 452714 &  834.7959\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 375582 | 2002.7362 |\n",
       "| casual | Mon | 257799 | 1653.5022 |\n",
       "| casual | Tue | 270936 | 1517.0445 |\n",
       "| casual | Wed | 291886 | 1436.6346 |\n",
       "| casual | Thu | 313310 | 1462.3344 |\n",
       "| casual | Fri | 346524 | 1641.7669 |\n",
       "| casual | Sat | 455777 | 1924.8735 |\n",
       "| member | Sun | 394506 |  830.9489 |\n",
       "| member | Mon | 471362 |  710.8147 |\n",
       "| member | Tue | 552484 |  718.9393 |\n",
       "| member | Wed | 579298 |  714.8681 |\n",
       "| member | Thu | 564862 |  722.0067 |\n",
       "| member | Fri | 501423 |  740.6443 |\n",
       "| member | Sat | 452714 |  834.7959 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     375582          2002.7362       \n",
       "2  casual        Mon     257799          1653.5022       \n",
       "3  casual        Tue     270936          1517.0445       \n",
       "4  casual        Wed     291886          1436.6346       \n",
       "5  casual        Thu     313310          1462.3344       \n",
       "6  casual        Fri     346524          1641.7669       \n",
       "7  casual        Sat     455777          1924.8735       \n",
       "8  member        Sun     394506           830.9489       \n",
       "9  member        Mon     471362           710.8147       \n",
       "10 member        Tue     552484           718.9393       \n",
       "11 member        Wed     579298           714.8681       \n",
       "12 member        Thu     564862           722.0067       \n",
       "13 member        Fri     501423           740.6443       \n",
       "14 member        Sat     452714           834.7959       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()\n",
    "  group_by(member_casual, weekday) %>%  #groups by usertype and weekday\n",
    "  summarise(number_of_rides = n()\t\t\t\t\t\t\t#calculates the number of rides and average duration \n",
    "  ,average_duration = mean(ride_length)) %>% \t\t# calculates the average duration\n",
    "  arrange(member_casual, weekday)\t\t\t\t\t\t\t\t# sorts"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3c901afe",
   "metadata": {
    "papermill": {
     "duration": 0.013326,
     "end_time": "2023-07-06T05:59:49.865678",
     "exception": false,
     "start_time": "2023-07-06T05:59:49.852352",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# Share**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "011c58f8",
   "metadata": {
    "papermill": {
     "duration": 0.012793,
     "end_time": "2023-07-06T05:59:49.891239",
     "exception": false,
     "start_time": "2023-07-06T05:59:49.878446",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's visualize the number of rides by rider type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "7d9de389",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:49.920322Z",
     "iopub.status.busy": "2023-07-06T05:59:49.919089Z",
     "iopub.status.idle": "2023-07-06T05:59:54.676542Z",
     "shell.execute_reply": "2023-07-06T05:59:54.675206Z"
    },
    "papermill": {
     "duration": 4.77404,
     "end_time": "2023-07-06T05:59:54.678210",
     "exception": false,
     "start_time": "2023-07-06T05:59:49.904170",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nO4QdITlPxQIAkATCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS6bW9ACBmKZOmJnO6\nOd07J3M6gLrGFTsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEik1/YCAKKSMmlqMqeb071zMqcD\n6jhX7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACKRXtsLgHokZdLUZE43p3vnZE4HQK1zxQ4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLptb0AAH7fUiZNTeZ0c7p3TuZ08PtSf8MuPz+/\ntpfws/T09BBCWlpagwYNanstSVJvt5xMtf5nm5GRkeQZa33L9fC7nJaWluQZ68iWMzIyan0l\nq1uyZEltL4E6of6GXVlZWW0v4Wfl5eUV/1unVlWjKrYc6tg3IjK1/mdb+V1OGluuD+rIluvV\nT2x+R+pv2C1fvjz5P4J/TV5eXnp6ellZ2bJly2p7LUmSn5+fnp5eWlpaf7acmprsl7TW+p9t\nPdxy8i9f1fqWk3+Rsi5sOTU1taSkpNZXAr/kzRMAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\n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\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACKRXtsLqDUFBQXrPKc0CeuoPY0aNfrlQVuOyRr3\nG2w5LrZcIeL9hl//Lq9u4cKFSVgJdV/9DbvCwsJ1npORhHXUnjX+CdhyTH7tL7ktx8SWK0S8\n35DYf7CgQv0Nu6KiovLy8rWfUw9/UthyTPwnv5Itx6S+/UMOwo6q8Bo7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASKQna6KySQ/c+sSUN79ekta1+3YnnHPiJjlpNTDUepwFAOB3JklX\n7D575NIbx03f4fBTrjjvuNxPXxh0/pjyGhhqPc4CAPC7k5SwK185bNxHHfte3WuvHbpts8t5\n15659Nun7/9u2Xoeaj3OAgDwO5SMsCtaNOWrwtL99tiw4m5W4122zM98ffIPIYSyknkPjRra\nr2+fw3sfffbF1744c8H/fG15edEXX3ydyFBreQgAoD5IxmvsVi57N4SwWe7Pc3XLTX/u/UUh\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "66950e90",
   "metadata": {
    "papermill": {
     "duration": 0.014001,
     "end_time": "2023-07-06T05:59:54.706047",
     "exception": false,
     "start_time": "2023-07-06T05:59:54.692046",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Let's create a visualization for average duration"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "ad28fd4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:54.735487Z",
     "iopub.status.busy": "2023-07-06T05:59:54.734246Z",
     "iopub.status.idle": "2023-07-06T05:59:59.546058Z",
     "shell.execute_reply": "2023-07-06T05:59:59.544637Z"
    },
    "papermill": {
     "duration": 4.82849,
     "end_time": "2023-07-06T05:59:59.547836",
     "exception": false,
     "start_time": "2023-07-06T05:59:54.719346",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2DU5f3A8ecuk4QRhgqCIoKKoCCOn7tUq7U4q0VxFEVFcdW90Ypo3SKKA4ur\n1tmKu2qromhFq1brVtx7sEICIft+f0QjKIQLkjt88nr90d597+77/Twxuby53EikUqkAAMDP\nXzLbAwAAsHwIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASORme4CWVVZWVldX\nl+0pvldUVJSXl1dTU1NRUZHtWTKnoKCgsLCwvr6+vLw827NkTm5ubnFxcQihrKys9bwNeCKR\naN++fQhh/vz5tbW12R4nc9q1a5dMJisrK6uqqrI9S+a4Q8v2LD/UsWPHbI9A9kUedvX19StU\n2CUSiWQymUgkVqipMiCZTIYQWtWqc3JyGlZdX19fX1+f7XEyJJlMNqw6lUq1qv/cjQtvVatu\nuEMLrWzVIYRkMtnavsP5GfGnWACASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\n5GbmMKnaOfdMuvbhaa/Mqkx2W22tXYcftsOgriGEEOqfvOPqB5566dPynHXX23TE0Qf2apPz\n3Y2WdFETNwEAaL0y9Ijdv8478ZYnv9p5xNEXnnPKtr2rrh5z5H2fzgshfDD5jMvufHbzPQ45\n69j9i95/bPTxk1Lf3WRJFzVxEwCA1iwTj9jVVX068b8zB593yW79O4YQ1uq7/pfPD7tv4tu7\nnTtg3J1v9Rk+buh2vUIIfS4Mex5w8e1fDt+3W3FIVS/+oq55S7wJAEDrlolH7OoqP+rZq9eO\na7b7bkNiUIeC6rnzquY+9Ull3ZBtV23YWtBx64Ft81+Y+nUIYUkXNXETAIBWLhOP2OV32Hr8\n+K0bz9bMe/uGL+atcUif6vl/CyH0K/p+hv5Fuf96fW4IoXr+q4u9qHrrxW9vPPvUU09NmjSp\n8eyYMWN69uzZ9Hh1o49f1pU1WyqEqhDyL7i8pKQkYwfNumQy2fC/rWrViUSi4UT79u2zO0lW\nFBcXFxUVZXuKzGn4Ji8sLMzPz8/2LJmTk5MTQsjPz29VP9or7B1aaWlptkdghZChF080+uiF\nf0y44sbaNXc8ffvuNR/NDyF0yfv+pQ9d8nJqympCCPVVi79oSdsbz5aWlr711luNZ2tqanJz\nl7LGup+4pOZLJBJLnSpKVt16NPzKb22SyWTDb/1WpXXeobXOVfOzkLnvy6o5b99w+YRHXpk9\neOjhf9p328JEorygKIQwu6a+a/63d4Uza+pyO+aGEJJLuGhJ2xuP0qdPnwMOOKDxbNu2bRcs\nWND0YJm/G66rq6uurs74YbMmNzc3Ly8vlUpVVlZme5bMycnJaXjwprKyMpVqLa/wSSQShYWF\nIYTq6uq6usz/oylrCgsLE4lETU1NbW1ttmfJnPz8/JycHHdosELJUNiVf/jYCSddlTNgyEWT\n9l+nS2HDxryi9UOY+vaCmq75BQ1bpi+o7dC/QxMXNXGTBv369evXr1/j2dLS0vnz5zc9W7um\nL24BdXV1S50qJkVFRQ33g61q1fn5+Q1hV1FRUV9fn+1xMiSZTDaEXWVlZav6ZV9QUNAQdhUV\nFdmeJXNycnJycnJqa2tb1Y92wx1afX19q1o1PyOZeLgqVV/xp9OuKfjVH67+46GNVRdCKCzZ\npnt+zkPTZjScrZn30ovl1Rtu07WJi5q4CQBAK5eJR+wqvvrrmxU1Bw8o/u+LLzZuzGuz1sD+\nHU4Y2vek68dMWeXkviVV900YV9x9++GrFocQQiJvSRct8SYAAK1bJsJu7jsfhRCuv/BPC2/s\nsOaZfx2/SZ9h5x5RNf62cWfOqkz0Hjj4nBMOSXx3hSVd1MRNAABas0TcT+suLS1d6nOZ2108\nNjPDNEqcc0lZWVmGD5pFRUVFRUVF9fX1s2fPzvYsmZOfn9/wRiezZ89uVc+x69SpUwihrKys\nVT3HrlOnTslksqKiolU9x659+/b5+flVVVXl5eXZniVzGu7Q6urq5syZk+1ZfqhLly7ZHoHs\na3WvzAcAiJWwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiERutgcAgJ+k3cVj\nM3m4qhByz7ssk0eE9HnEDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBK52R6gZeXk5GR7\nhMVIJBK5uZF/5ReWTH7774dWterG772cnJzGr0D0EolEw4lkMtmq/nM3aG2rbvjP3dpW3WAF\nvBuvra3N9gisEFas78vlrk2bNkttu+rMjLKQvLy8Dh06ZPywWZZMJlvhqkMI7du3z/YIWVBc\nXJztETKqIXEKCgoKCgqyPUvmNKx6RbhDy/zd+Ap4hzZr1qxsj8AKIfKwmzdv3lL/EdMuM6Ms\npLq6uqysLOOHzZqioqKioqL6+vrZs2dne5bMyc/Pb0i6OXPm1NfXZ3ucDEkmk506dQohlJeX\nV1dn/rdt1nTq1CmZTC5YsKCioiLbs2RO+/bt8/Pzq6qqysvLsztJ5u/G6+rq5syZk/HDwtK1\nlr8QAQBET9gBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAEQi\nN9sDkB3tLh6bycNVhZB3/vhMHhEAWiGP2AEARELYAQBEQtgBAETCc+wA4pHJp8+mQqgKIYy9\nOGNHBJbKI3YAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJHIzfYAkDntLh6bycNVhVBw4RWZPCIArVymw+6mww8oHDtx75XaNJz9+tnRh5z/2sJX\nGPWXv+3UsTCEEEL9k3dc/cBTL31anrPuepuOOPrAXm1ymtwOANCqZTLsUu/9+8Z7vijdM5Vq\n3FT6v9I2nXc55pD+jVvWLM5vOPHB5DMuu/Pj4UcedVDH2gevvWr08bW3XnNYYsnbAQBauQyF\n3VdPjz/jz898M7fqB9u/ebOspN8WW2zR/4c3SFWPu/OtPsPHDd2uVwihz4VhzwMuvv3L4ft2\nzVv89m7FGVkHAMCKK0Mvnug0YOipZ51/yYWn/GD7K2VVHQeV1C0o++qb0tRC26vmPvVJZd2Q\nbVdtOFvQceuBbfNfmPr1krZnYg0AACu2DD1il9+hR58Ooa668AfbX55XU//vK/aa8HZNKpVb\nvNIO+x4zapcBIYTq+a+GEPoVfT9e/6Lcf70+t3rrxW9vPPvUU09NmjSp8eyYMWN69uzZ9Gx1\ny76sZZSXl1dSUpLxwy4i86tOJpOtcNUhhPbt22fjsFlWXFxcVFSU7SkyJ5lMhhAKCwvz8/Oz\nO0nmv8nz8/Nb4Y/2inCH9gOlpaXZHoEVQjZfFVtX/fncRM4anTa/8LZzOtSVPfeP6y6ddEbB\nWjeP6FtSXzU/hNAl7/tXRXTJy6kpq1nS9sazpaWlb731VuPZmpqa3NylrDHz9wiJRGKpU7W0\nrCSOVbceOTmt8SVNyWSyofCyyB1aZqwIq4bFyub3ZU5+97vuuuu7c10G73Pq9H8Nm3Ld6yMu\n2SpZUBRCmF1T3zX/23vJmTV1uR1zl7S9cZ89e/bcY489Gs8WFxdXVlY2PUbmX3hRV1dXU1Oz\n9Ou1pMyvOpVKVVX98EmWGZaVF9lUVVWlUqmlXy8KiUSioKAghFBdXV1fX5/tcTKnoKAgkUjU\n1tbW1tZmdxJ3aJmxItyhwWKtWP/g2GjlNlPmzAgh5BWtH8LUtxfUdM0vaLho+oLaDv07LGl7\n4x4GDhw4cODAxrOlpaXz5s1r+qDtlvMilq6urm6pU7W0zK86lUq1wlWHEObPn996EieZTDaE\nXWVlZXV1dbbHyZz8/PxEIlFdXV1RUZHdSTL/TV5bW9sKf7Tr6+uzvmpYrGz+1aB0+lUHjzzy\n6+rvfuel6qZ+WVHSb+0QQmHJNt3zcx6aNqPhkpp5L71YXr3hNl2XtD0b4wMArFiyGXbt1xzW\nueLrU86+9sXXp7/7xv9uH3/yU/PbHTpy7RBCSOSdMLTvu9ePmfLS9C8+eO26M8cVd99++KrF\nS9wOANDqZfNPscncLudcdfaNE2+9/NzTK3Pbr9lnvVPGjx3UNq/h0j7Dzj2iavxt486cVZno\nPXDwOScckmhyOwBAK5fRsMvJ73H//fcvvKWgY//DTjvvsMVeO5Gz/QEnbH9A2tsBAFq3LL8y\nHwCA5UXYAQBEQtgBAERC2AEARELYAQBEQtgBAERixfpIMYDlpd3FYzN2rG8/KvWsCzJ2RIDF\n8ogdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCS8QTHEL5Nv1VvV8H+j\nz83YEQFo5BE7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBI5GZ7gJaVk5OT7REWI5FI5OZG/pVfrNa56pycnGSy1f0LKplMtsL/3FbdeqyAd+O1tbXZ\nHoEVwor1fbncFRUVLbXtqjIzykLy8vJKSkoyfthFZH7VyWSyFa46hNChQ4dsHHYRmV9427Zt\nM37MH8r8qgsLCwsLCzN+2EW4Q8uMFeEO7QdmzpyZ7RFYIUQeduXl5Uv9R0y7zIyykOrq6rKy\nsowfdhGZX3V9ff3s2bMzfthFZH7VIYTZs2fX19dn48jfy/zCy8rKqqurM37YRWR+1RUVFRUV\nFRk/7CIyv+qqqqry8vKMH3YRmV91XV3dnDlzMn5YWLpW9xciAIBYCTsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEjkNuva\nsz/7YMb8mh9vX2eddZbTPAAALKN0w65y5mO/22rYQ+/MXuylqVRq+Y0EAMCySDfs/rzb8Iff\nLd/58FN/M2CN3ESLjgQAwLJIN+zOfWHGmsPufuDqXVt0GgAAlllaL55I1ZXPqKnrOWxAS08D\nAMAySyvsEjltf1lS+MFNL7b0NAAALLM03+4kcceD51Q//PsR5/zl6/m1LTsRAADLJN3n2A09\n9b5VuuX95Y8jbj7r4E5du7bJWeQFFJ9++mkLzAYAQDOkG3ZdunTp0mW7nhu06DAAACy7dMPu\nnnvuadE5AAD4iZr3yRMVn//vrvseffODLyrqcrut2f/Xvx260WptW2gyAACapRlhN/mPe+/3\np79V1X//IROjjz1sz9G33jn2dy0wGAAAzZPmq2LDh3/fb+g5d648+KA7H/3P59/MmjPjixem\n3HXwL1f52zlDh9/9UUtOCABAWtJ9xO6SY+9v233E249NKkp++3rYjbf53UaDh9T37Pq3P1wa\n9pjQYhMCAJCWdB+xu2NGxdqHHtNYdQ0SyaJjjlpnwYzbW2AwAACaJ92wa5tMVn5d+ePtlV9X\nJnK8fgIAIPvSDbtj1+rw3s1HvDinauGN1XNfOuq66R36HNMCgwEA0DzpPsfuwLvGntX/D1uu\nMfCgow7cckCfwrDg/dem3XTlDdMr8q/4+4EtOiIAAOlIN+xK1jnizUdzf3/E6RPPO3Xidxs7\nrfOLq67662F9S1poOAAA0teM97Hrsc2hT751yGdv//eN97+oCgWrrtlvw3VXS/dPuQAAtLDm\nffJECIkefTfu0bdFRgEA4KdoKuwGDRqUSBa89N/nGk43cc2XX355Oc8FAEAzNRV2bdu2TSQL\nGk6XlHgiHQDACq2psHv66acbTz/xxBMtPwwAAMsu3Rc/bL755pd8Nu/H27+advTW2w5friMB\nALAslvLiibIP3/uyui6E8Nxzz6351lvvzG+/6OWp1//x1LSnP2qp6QAASNtSwm7ybzY9aPrs\nhtO3/fr/blvcddqvceTyngoAgGZbSthtMXbcxNLKEMJhhx02+JzL9lmpzQ+ukMxrt/nvhrbU\ndAAApG0pYbfOsAPWCSGEcMcdd/z2oJGjVm2bgZkAAFgG6b5B8ZJeFZuqryifH9q3K1p+IwEA\nsCx+6keCffbY7p1XWne5jAIAwE+R7iN2qbp5Vx57yF8ef3HWgtqFt3/1yceJNv1aYDAAAJon\n3UfsXh77y6OvvKOspNfa3Wo/+uijvgM2GDigb+6sLxKdtrn6vkdadEQAoLUpykmutc9T2Z4i\n+y7r3bGo887pXz/dR+xOn/BG5/XOnT5tdKpu3pptO2515c2jV2u34Jup6/Xacd6qxcs0KgAA\ny1O6j9g9XVa9xt47hxASOW2Hr1w05aVZIYQ2Kw++ecQa5w6d1IIDAgCQnnTDrmNuoqa8puH0\npj2KP7/v84bTPffoUfreZS0yGgCwIkhVV9WmVugdNqm+trQuYwfLtnTDbmT3du/deMGnVXUh\nhNV27f7ZQ39u2P7V41+31GgAQPbcsW6XDj3/+MKfj+/RoW2b/JySldf8/ek314fw4k2nDFpj\nlTYFbXv123TM7W8ufJN5Hz917N47rL5SSUFxp76Dtj372ofqf9oOX73r/MHr9yzOL+jSve8+\nx1z6eXVdmoe7cZ3OHXtfVlX6/O9/2a9tQad5dWl15JfP3LrX9ht3bldY1GGlzYbs9/cXZjRe\n9Nb9V/32lxt26VCcm9+mW+8BB5x8xeyF2rS+ZuZVpx40oHfXwry89p1X+9Wwo5+bWdlw0cmr\ntW+/2skLH+V/Z2+USCQ+qqpLc+fNku5z7EbdcMjYbS7p3WX1d2Z80nv/kRWnHb75gavs0avm\n0ktf79T/kmU7NgCwIqv45tatjpqz37Fnbrpawf1Xn3/r+Qe888H1bzxecfzxZ+xf9+Hlf5ow\ndvjG2+1UulX7/BDC/C/u3WDdvT5JdN/vwEP6dMl55cm/jzlsp3un3fjyX0Ys2w5nvPTHDf82\nbbs9Dzhht3avTL3rjitOfOypdz/578Q2yZDO4eprZx+wwW9mbT38vCuObpNMLHWxX/373LV+\neVaqyyb7jzpl5ZzZd19/3d5bPlL2zocH92r/6T+OXO+317RfZ/DIP5zSKb/2zWfuvvniY579\novf0W3ZquO34HTc48fGvthl26J4jVyv75MWJk67a7ulP5nx+b97SDxuWuvNmSTfsug2+6OXJ\n3c6+9oFkIhR3G3X7sXftN/6S51Kp9r13uOuRUctwYABgBVdb+cGJj39+8barhhAO2K9/m847\nv3zve1O/+mDLkoIQwq69X+mz75QJn5Vv1a9zCOGSX4/8JNFn6icvbd65MIQQwgX3njBo93EH\n/ums3Uev2WEZdjh3+tQT7n7nkt3XDiGE1EU3HjHooInX/v7B0ybv2jOdw5V/+qfSK1589KgN\n01pqqnr4rn+qL/n1S+/f37c4L4Rw2ilDu3fd9ox9Hzr42b2fOOVvyYLVXvnfY6sX5IQQQhi7\nUo/2Ex+5NoSdQgi1C6af9PgXq/3mrsdv36NhZ3u023LXG5+5e+aCYT/6LNYfa3rnzZXmn2Lr\nq6qq+v32uLsfmdKzICeEMGzco7M/fvt/b308891Htl956UMDAD87eUV9GyIshFDYaad2Ocku\n641viLAQwkpbbB1CWFBTH0KorXjjnDdn9z38L99lVggh7PjHy0MId14zfRl2GEJo2+3Qb6su\nhJDIHX7ZPUU5yaf/+GS6h0sU3DxqgzRXWv75ZY/Nqdzoossbqi6EUNhp8L3XXHnmwV1CCEP/\n/c7XX7z5XXiFVP38qlQqVVfx7XGSbfITofStu1/8tLxhy+YXPTNjxox0qm6pO2+utB6xS9WV\nlxR13PS2d58c1rtxY/vV1h64bMcEAH4OkrmdFz6bmwgFK3VsPJtI5jWerpz9cF0q9dql/5e4\n9Ic7mfva3GXYYQih4/pDF7lyYZ+dOhU+9PXTIRyQzuHy226wcl66ryUoe/eJEMKW266y8Mat\nDz586xBCCEUlnWa/8MhfHnnqjenvf/zJR2+9+srnpVWFJd9eLadgtX+eP3zn02/5v56391xv\n0y022+wX2+6w59Bfd8pN4w+xS9t5c6UVdomcDies2+nmG14IC4UdAMC3kvkhhPVPvqHxAblG\nBR3SfdjsB36cRbmJkEgWpHm4RLIZ77NbX1UfQshPLD7FJp/wqz0ve6L7oG132Waznbf8zQlj\nB35+6PZHffP9FX5x8l++GXHavfc++ORT/37m0Ztum3TZ8cdtdu/rT2y/0AOKjVL1i7wwYqk7\nb5Z0n2N35tMP/W/LnY68os3YUTt3/u7RQgCAEEJhpx1zEsfWlq6zww5bNG6sXfD25Ptf6Tqw\naNn2Ofv1e0PYvvFsXdVHD8yqbL/5r1ricO3X3jCER595fmbo2b5x45RTDv/rrI7XXrbrsMue\nWG3HiR8/eGjjRTcudNuaee+89EZp54Eb7X3oiXsfemII4a2Hz+m34x+POePlN6/ZvGH2hY/1\n9YuzG09Xlz/X9M6bK92HKHfea/SCVVa/5tjdVypq161Hz16L+gkDAAA/e7mFfcb06/TuXw94\n/Kvvnxx2+5G77bPPPp+k2xo/NO+Lq0//xwffnau77cTd5tXV73bRli1xuPY9TxvYNv8/R5/4\nYeW3EVY999n9L5/04PMr11a8XZdKddpgo8YrV3w57dLPy0P49oG3+V9fs9lmm+11wcuNV1hj\n401CCLXza0MIRTnJytn/mPndEwcrZz13xJTPG6+51J03V7qP2BUWFoaw6k47/fABTwCAEMKx\nD109ae39hvReb/e9d91orU6vT7nzr49OX3/EX4evvIyP2BWsVHjBrv1e3++gTXq3e/mJv90z\n9aPVdjjnqs1XaYnDJXI63HfLEWvtfvn6fQYf+PsduuaV3jNp4pd1xVfdNaJopcLtOh/xxMU7\nH5V34kY9ij5447nrJt7fu2th9acvXXHr3w/eZ2iHNc7ebqU/P37OL3b84MDN+q9ZX/rRvdfd\nkJPXecx5g0IIuw5f++xzXxi47f4n/37bmq/evmnc5V93yQ+f1TYct2ilvZveeXMXkm7YPfDA\nA83dNQDQerRdfa9XX+1wyinn33f39fdW56+5dr+zJj18xsG/WeYdbjp+2v7Tr7ny5nsevX12\nu1XXOeiMSZeNObjxSXDL/XA9d7vsrYf6Hn/elTdPOKcq0bb/prv85dzxv1+7JIRw78sPHHno\n6HsnnPXXvFU23GiLSS9+sNmC6zbZfsxJhx35uz33KM7vcP9rj51yzFn3PXzro7fOb9Ox24Zb\n73vXWRf+tkfbEMKgs5+8smLkhMmPn3T4bTWpVPct9//XxTO22uLhb4+aLGx6581dRSKVSuux\nvrlz5zZxaYcOHZp74MwoLS2tra1t+jrtLh6bmWEaJc65pKysLMMH/YHMrzrv/PGzZ89e+vVa\nUuZXXXDhFbNnz66vr1/6VVtS5hdeNfrc6urqDB/0BzK/6rqzLqioWMZ3KFheMr/qMPbi8vLy\nTB90UZlfde55l82ZMyfDB12qLl26ZHsEmlJfVfbZjNrVe3Rq0aOk+4hdSUlTr7tNsw4BAFqn\nZEH71Xu0+FHSDbsxY8Yscj5V+8UHb957532zE93HXHPech8LAGC5+OienQcd9EwTVyjoMPir\nj+7N2DwtKt2wO+uss368cfzF//nV2oPHX/7f0Qfut1ynAgBYPtbY/cE5u2d7iExZ1pcghxBC\naLPKppPGbjDzlcumzq1aXgMBALBsflLYhRCKehQlEjnrFOUt/aoAALSkn2DspV4AACAASURB\nVBR29TUzLjvzf3ltB3VN+7PYAABoIek+x27zzTf/0bb6L9999eNZlRufceXynQkAgGWQbtgt\nTnK19bf97a9+f9HoTZfbOAAALKt0w+7ZZ59t0TkAAPiJfsojdgBAnFruA0XatWvXQnsmNB12\n9913X5p72W233ZbHMAAALLumwu63v/1tmnvxkWIAEJn8c0cv931Wn/Gn5b5PFtZU2D355JON\np+trvjlzvxEvLFj1oD8cuu1m65XkVL77xrMTL5rw5WpDn3xoXIuPCQDA0jQVdoMHD248/cRh\n671QsdZTH/9n004FDVu233H3Q4888JfdBg0dPfyt63/dsmMCALA06b6x8Mm3vdv799c0Vl2D\n3KJ1Lxu59vt3ntgCgwEA0Dzpht17C2qT+Yu7cjLUVX22PCcCAGCZpBt2e61U9N7Np3xUVbfw\nxrqqT06//t2ilfdugcEAAGiedMNu9MR9q0qnDlxvyPi/3vPcy2+99b//3HfrFTuuP+CxOZX7\nXHNqi44IAEA60n2D4tV3vXbK+Ny9Tr72uP0fbdyYk7/SEeMfv2rX1VtmNgAAmqEZnzyxzTFX\nfXHQSf988NHX3/+iJlnYvc/62+3469Xbfr+HwX3Xmvr2uy0wJABAC+qUl7P7mzOvX6tjtgf5\nqZr3kWJ57dbYeZ9Ddl7CpZ99/NFS93DT4QcUjp2490ptvttQ/+QdVz/w1Eufluesu96mI44+\nsFebnKVd1MRNAABar3SfY7c8pN779w33fFFau9DHVHww+YzL7nx28z0OOevY/Yvef2z08ZNS\nS7uoiZsAALRmGQq7r54eP3L4XsdfdO8iHz6Wqh5351t9hp87dLvN+2+09bEXHjnv84du/3J+\nUxc1cRMA4OesZt4bJ+87ZO3uJUUlq/xq7xNfm1fTsH3B1/8+fPdfdC1pm1tQ1Gu9rS+YPL1h\n+0ePTNxpk36digu6dF9zt8MuKKtLhRBCqiqRSPzp0/LG3XbKyzn43TlN7CcmGQq7TgOGnnrW\n+ZdceMrCG6vmPvVJZd2QbVdtOFvQceuBbfNfmPp1Exc1cRMA4GcsVX3IoC1veKvjhTf+4/G7\nJ678yvW/3PS0hktO2mLnyV/0u/7+x1/896PHbFc3eu9NP6uuqy57esDOR4bfHPfQU8/97coT\n/3vTGTtOeLPpIyx2Py2/sIxq3nPslll+hx59OoS66sKFN1bPfzWE0K/o+xn6F+X+6/W5TVxU\nvfUSb9Jg2rRpt9xyS+PZk08+uXv37k3PVr9MK/opcnNzO3TokPHDLiLzq04kEq1w1SGEdu3a\nZeOwi8j8wouKitq0abP067WkzK+6oKAgLy8v44ddROZXnZeX1wp/tJPJZNZX/QNz585d+pVW\nbLPfOunmD6qfnH3TLzrkhxAGPD5z5/1u+7K6vlt+cs3DTr9+xB92WqlNCKFv79OPu3yXV+fX\nbDX3kfK6+lFH7LdZt6Kw0aDHJnd7t6hz04dY7H565Ef1TP0Mhd1i1VfNDyF0yfv+C9olL6em\nrKaJi5q4SYOZM2c+//zzjWcrKyuXej9b9ROX0XzJZDKZzOSzGxcj86tOJBJZ/52X+VWHELK+\n6pCNhefmZvO+pUHmV52Tk5OTk+XfEO7QMmNFuEOLz2f3Tyvs+OuGqgshFK96yBNPHNJw+rjj\nR025766L3njno48+fPnpBxs2tu1x3O83uXGPNXoNHvLrrbbccvshv91lva5NH2Kx+4lMNu98\nkwVFIYTZNfVdv/uwspk1dbkdc5u4qImbNOjZs+cee+zReLa4uLiysrLpMRLLaz1pq6urq6mp\nWfr1WlLmV51KpaqqslJW38v8qkMIVVVVizy1NBsyv/Dq6ur6+qw8Qvq9zK+6tra2trY244dd\nhDu0zFgR7tDiU19Vn0gW/nh7XdWnu/Tt/0LJ1ofuuf3WO2950DH7bjJw5xBCMrfLX5//7PRn\nHvnXk08/M+Xmi0476pcnPvzwBdv/eMfVqab2E5lshl1e0fohTH17QU3X/IKGLdMX1Hbo36GJ\ni5q4SYOBAwcOHDiw8Wxpaem8efOaHiPzfyerq6tb6lQtLfOrTqVSrXDVIYT58+dnPXEyv/DK\nysrq6uqMH3YRmV91dXV1RUVFxg+7iMyvura2thX+aNfX12d91fHpvvOAynMmvzivZuO2eSGE\niq//2nuDk29886ONPznhkU+qvpz+wCp5yRBCxTe3Nlz/62fGnX9P9fhLTl13yx2PCeHNiVsM\nOunkcMHLDZfOrvn2jnf+l7fNr6sPIcx5e/H7iUw2Hz8vLNmme37OQ9NmNJytmffSi+XVG27T\ntYmLmrgJAPDz1WWDCbusUr/Tdoc++MTzLz3z8BG/Pq6y7a6/6VhQ0HmTVH31pXdO/fizD6c9\n8pe9tz0lhPD6+1/nrlx++aWn7X/uTc+9/Np/nrz3/Kve6bDOniGEkCjYrH3BnaMueGn6x689\n+/CB2x2dTCRCCEvaT2SvnsjqEyMSeScM7fvu9WOmvDT9iw9eu+7MccXdtx++anFTFzVxEwDg\nZyuR0/bO16bs1f3TY/bd/pe7j/q4/8gnX5wQQmjX46RHLjrivtP26tt/i+MvfezIu984eOMe\no7dc/6vuox++9KhXbjjlF5tsuPN+x8/YYOSTT57UsKv7/nnF2l/esVW/NQdsseOXm/9pt86F\nTezn7YosP4Ni+Vqef4odM/6K5t6kz7Bzj6gaf9u4M2dVJnoPHHzOCYcklnZREzcBAH6+Cjr9\n34TJj0340fYdTrrqnZOu+v7sC59eF0IIof/xE35z/I+vHlbe7NAprx+aql/w9ZzQtXObcN3h\nTe8nhDC7JpJH7poXdu88fuft/3z2k29m/+LCiXvnTfvPFwMGr7dy46XDRx3e9M1z8nvcf//9\ni2xK5Gx/wAnbH7C4ay/poiZuAgAQQgghkWzTdSnvfxKh9MMudfWBWx1507SGM0VnXrHTvCu2\nGfTgL0ZOeOzaI3M9aAYAkG3pPsfu/Vv3OPKmab86cvwr737esKXjWhedd+jmUycdtevEt1ts\nPAAA0pVu2J17wqOd1j31sSuPGdDn24/zyi3qe+rEZ85ev/PUMee02HgAAKQr3bC7a+aC3iP2\n/fH23fdfs3LWA8t1JAAAlkW6Ybd6QU75u2U/3j7njbk5Basu15EAAFgW6Ybd6Zuu/N4t+z83\nc5GP56r4YsqBd37QZdApLTAYAADNk+6rYve4889/7Lnb4F4bjBi1bwjhjTtuOKf01euvvvXz\n+m53/H2vlpwQAMiC6jP+lO0RaLZ0w67NSju+/Mr9h4064bpxY0IIT55xwtRETv9t9rrnyqt3\n7uaDHwAgNu3/++py32fZRgOW+z5ZWDPeoLj9WkNumzLk+hkfvvH+F7U5bXqs1b9HSUHLTQYA\nQLOkG3bz58//9lTRyuuu3/BpE7Xz59fm5hUU5C/PzyUDAGDZpNtkbdu2XdJFydyi7r16bzp4\nh1EnjN6ub8lyGgwAgOZJ91WxE6+5YsMOBYlk/qBtdzn0yKOPOerw3bffuCCZ6LLhnkcdtv9m\n667071vG77B+r0nvzW3RcQEAWJJ0H7HbZNbfj6rqevtLLw4b2KVx4+zX7tpkswPanjf9bzt0\nry575/f9Nh69162HvHREy4wKAEBT0n3E7tiLn++93y0LV10IodP6Q285oOf44ceHEPLbr3PR\nVf9X+vbly39GAADSkG7YvVFRU7TaYt7WpHj14so5/2o43aZ7cV31F8ttNAAAmiPdsDu4e9t3\nrjr706q6hTfWV38xdvxbbVcd0XD24XNfK+y04/KdDwCANKX7HLtT7jnrmo1P6rfW1ocftvfG\nfXsWhKqP33npb9de9eysnEtfOKNq7hN77DTyoWc+2mXiwy06LgDAMqv4+vririM/rKxdoyAn\n27O0iHTDrvMGx7/zRKcDjzr94tHHNG4sWWvra6fcMXKDzvO/fPPp9/MPu+Dua0b1bZk5AQBY\nima8t/CqW4/45ysjvnz35f+9/XFFXW7XXutuOqB3TqqirLyifbcjyr48suWmBABajbqa+py8\ndJ8sttxv3pRU7bxE7hLf2XdF0Ox1d1tr0JBdfvu73+685cDeuYnw2WO7d15p3RASLTEcANB6\nrFqQe8ajNwzq2q4gN69rn03//PyMF/9yUt9uHQvadtl092Nn1tQ3XK2u+vPzjti918olBW07\nrT94z5umfdWsm4cQvnnuxu02WKNNfuGq62w65ub/Nr3bEEKnvJwJn3xy/J7bdO2+b6a+GMso\n3bBL1c2b8Id9Nu63Vq9FrT3k0URuuxYdEQBoJcbtfulhNzw2/fVnhrb74Iit19/jjtSN/3x+\n6p1j3npgwt6TP2y4zuitN7z06dxzb7rn2cfvGbVZ6uBf9Lnu3bnp3zyEsOvO5w0+ZtyUx+87\n+hf5Y0dsMvrZr5vebQjhrpE7lex44tRn/5zBL8aySPdPsS+P/eXRV/53rc23X7vkrX89+9lv\ndv1tQah844kpiU7bXH3HX1p0RACgldhw/N2jdlwnhHDG1f939ZaP/GPyBesX5YYBa5282hm3\nPz0j7N173ufjLnph5tTSW7dunx9C2HDTwTX3dx57xDMjH90xnZs3HGXTSY+euXfvEMLmW+9Q\nNq3ztSPvOO1fdU3sNoTwTa/L/3jgttn4kjRPumF3+oQ3Oq937vRpo1N189Zs23GrK28evVq7\nBd9MXa/XjvNWXcz72wEANNcqW377UQh5JYU5BauvX/RtqHTOTabqUyGE0rf/mUrV/6JDwcK3\nKql+O4Qd07l5g6N+06Px9H6HrjXuj38rfbttE7sNIfQZ0W/5rbIFpRt2T5dVr3vCziGERE7b\n4SsXTXlp1ujV2rVZefDNI9bYbeikY984uSWHBABaocU8YSyvQ5tkbsn8eV8t/Oz+RGKxPbPE\n55stfEF+p/xEMm+pu23fKT/dqbMq3efYdcxN1JTXNJzetEfx5/d93nC65x49St+7rEVGAwBY\nVIc1D0nVzb36k8qCb+WP3ulXI2/9oFk7ueqx7z8o6/ZL3+qw9vDlstsVQbphN7J7u/duvKDh\nkydW27X7Zw99++TBrx7/uqVGAwBYVGGnnS7bvvsZW+1y7Z0Pv/ryc5cetfXlz3x+wO6rN2sn\nD+y//YW3PPDic1PGHfmrMa+VnX7TbstltyuCdP8UO+qGQ8Zuc0nvLqu/M+OT3vuPrDjt8M0P\nXGWPXjWXXvp6p/6XtOiIAACN/vDgfyuOPvS8I/b6qqpgnQ22+etT9/6qpGDpN/tOTn63f47b\n85SzDznr08o+G2x08d2vH71ux5++2xVEumHXbfBFL0/udva1DyQTobjbqNuPvWu/8Zc8l0q1\n773DXY+MatERAYDW4Iuq2sbTndedXLPg+4sOf3f24d+dTuatfNo19552zbLcvGiVg2urDg4h\nvHDY+T+4+ZJ2G0KYXVPXvJVkTzM+eWLg7sfdvftxDaeHjXt0yHHTP5xf2G+d1fO8OTEAwAog\nzbCrr6qqSeYXLNxw7Vdbe2DLzAQAwDJI68UTqbrykqI22//t/ZaeBgCAZZZW2CVyOpywbqcP\nbnihpacBAGCZpft2J2c+/dCAT/9w5BX3zar62Tx/EACgVUn3xRM77zW6fpXVrzl292uOK1yl\n20qFeYsU4YcffrikGwIAkBnphl1hYWEIq+6006otOg0AAMss3bB74IEHWnQOAGCFUrbRgGyP\nQLM1433sQgjvPH7n7f989pNvZv/iwol75037zxcDBq+3cgtNBgBkS7t27bI9Assi/bBLXX3g\nVkfeNK3hTNGZV+w074ptBj34i5ETHrv2yFzvUQwAkG3pvir2/Vv3OPKmab86cvwr737esKXj\nWhedd+jmUycdtevEt1tsPAAA0pVu2J17wqOd1j31sSuPGdDn29dP5Bb1PXXiM2ev33nqmHNa\nbDwAANKVbtjdNXNB7xH7/nj77vuvWTnL6yoAALIv3bBbvSCn/N2yH2+f88bcnALvgQIAkH3p\nht3pm6783i37PzezcuGNFV9MOfDOD7oMOqUFBgMAoHnSDbs97vzz6olPBvfaYNSJY0MIb9xx\nwzknjei31g6f1Heb8Pe9WnJCAADSkm7YtVlpx5dfuf93mySvGzcmhPDkGSecdekt7Tbb856X\nX/1dt+IWHBAAgPSk+z525XWp9msNuW3KkOtnfPjG+1/U5rTpsVb/HiUFLTocAADpSzfsVurS\n53f7jzjwwAO326DXxiv1atGZAABYBun+KXZwn3D7hLO2H7Rajw22++Plt74/p7pFxwIAoLnS\nDbt/vvD+rHf/c/W5J/Spf/ucY3+/9kqdB/9u1E0PPregvkXHAwAgXemGXQihY+9NDh99yZOv\nfvblG/++9PQR1a/fc+Aum3futu5BJ13YcvMBAJCmZoRdo679tjx27ISpz/1n3JG/qZ7xzo2X\nnLrcxwIAoLnSffFEowVfv3P/3ZMnT578wBMvV9anOqwxaNiwvVtiMgBYARUOGRaefi6TR5yx\n3jqZPBw/a2m/3clnr90zefLkyZMf/vcbNalUm1XWHXrUWfvss8+QzdZOtOiA0SkcMixMeyGT\nR3SPAACtRLphV7L6wPpUKr/DGruOPHmfvffedZsN8gQdAMCKJN2w+81+f9h77733GLJZcXKR\noEvVV5TPD+3bFbXAbAAANEO6YfePv16+2O2fPbb7mru+XVP58fIbCQCAZZFu2KXq5l157CF/\nefzFWQtqF97+1ScfJ9r0a4HBAABonnTf7uTlsb88+so7ykp6rd2t9qOPPuo7YIOBA/rmzvoi\n0Wmbq+97pEVHBAAgHek+Ynf6hDc6r3fu9GmjU3Xz1mzbcasrbx69WrsF30xdr9eO81YtbtER\nAQBIR7qP2D1dVr3G3juHEBI5bYevXDTlpVkhhDYrD755xBrnDp3UggMCAJCedMOuY26iprym\n4fSmPYo/v+/zhtM99+hR+t5lLTIaAADNkW7Yjeze7r0bL/i0qi6EsNqu3T976M8N2796/OuW\nGg0AgOZIN+xG3XDIghl39+6y+oeVdb33H1nxzV83P/Dki8cet/Olr3fqf0qLjggAQDrSffFE\nt8EXvTy529nXPpBMhOJuo24/9q79xl/yXCrVvvcOdz0yqkVHBAAgHemGXQhh4O7H3b37cQ2n\nh417dMhx0z+cX9hvndV9thgAwIqgGWH3A+1XW3vgchwEAICfJt3n2AEAsIITdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkcjN9gAtK5lM5uTkZHuKLFtxvgIrziSZlEwmE4lEtqfItNb5o5dIJKyalpDOV7iuri4Dk7Di\nizzsiouLl/rzUJWZUbKnY8eOP96Y+VUnk8nFTpJJWflvXVJSko3DLiLzC2/btm3Gj/lDmV91\nmzZt2rRpk/HDLiLzq87Pz8/Pz8/4YRfROu/Gf2DmzJkZmIQVX+RhN2/evNra2qavk/3fPy1s\n1qxZP96Y+VXX19fPmTMn44ddRFb+W8+ZM6e+vj4bR/5e5hdeVlZWU1OT8cMuIvOrrqioWLBg\nQcYPu4jMr7q6urq8vDzjh11E67wbh8WKPOxSqVQqlcr2FFm24nwFVpxJMqnVfhNadSvRar/D\nM8lXmPRFHnYAtJzCIcPCsy9m8ogz1lsnk4eDnx2vigUAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEtzsBWA4KhwwLz7+cySN64w/gx4QdtJTCIcPCk89k8oh+0wO0csIOWM4KhwwLL72W\nySMqWoAGnmMHABAJj9iRCYVDhoWnns3kET2EA0Ar5BE7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEjkZvfwXz87\n+pDzX1t4y6i//G2njoUhhBDqn7zj6geeeunT8px119t0xNEH9mqT0+R2AIBWLcthV/q/0jad\ndznmkP6NW9Yszm848cHkMy678+PhRx51UMfaB6+9avTxtbdec1hiydsBAFq5LIfdN2+WlfTb\nYost+v/wglT1uDvf6jN83NDteoUQ+lwY9jzg4tu/HL5v17zFb+9WnPnhAQBWKFl+jt0rZVUd\nB5XULSj76pvS1ELbq+Y+9Ull3ZBtV204W9Bx64Ft81+Y+vWStmd8cACAFU6WH7F7eV5N/b+v\n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\n1wAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "all_trips_v2 %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length)) %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3d9a1a14",
   "metadata": {
    "papermill": {
     "duration": 0.01386,
     "end_time": "2023-07-06T05:59:59.576089",
     "exception": false,
     "start_time": "2023-07-06T05:59:59.562229",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS**\n",
    "\n",
    "Creating a csv file that we will visualize in Excel, Tableau, or my presentation software"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "2f0c4c24",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-06T05:59:59.605322Z",
     "iopub.status.busy": "2023-07-06T05:59:59.604125Z",
     "iopub.status.idle": "2023-07-06T06:00:02.806384Z",
     "shell.execute_reply": "2023-07-06T06:00:02.805047Z"
    },
    "papermill": {
     "duration": 3.218993,
     "end_time": "2023-07-06T06:00:02.808315",
     "exception": false,
     "start_time": "2023-07-06T05:59:59.589322",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)\n",
    "write.csv(counts, file = '/kaggle/working/avg_ride_length.csv')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4cac5565",
   "metadata": {
    "papermill": {
     "duration": 0.013322,
     "end_time": "2023-07-06T06:00:02.835421",
     "exception": false,
     "start_time": "2023-07-06T06:00:02.822099",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Conclusions**\n",
    "\n",
    "* Members take more rides throughout the week vs casual users\n",
    "* Casual riders take less trips/rides but for longer durations of time vs members"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "55aceca5",
   "metadata": {
    "papermill": {
     "duration": 0.013872,
     "end_time": "2023-07-06T06:00:02.865580",
     "exception": false,
     "start_time": "2023-07-06T06:00:02.851708",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Recommendations**\n",
    "\n",
    "**Members and casual riders differ in how long they use the bikes and how often they use the bikes. In order to get more casual riders to buy a membership my top recommendations are:**\n",
    "\n",
    "* Give discounts for longer rides when you have a membership\n",
    "* Longer rides can get some type of rewards program when they become members"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 90.631802,
   "end_time": "2023-07-06T06:00:03.206688",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-06T05:58:32.574886",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
