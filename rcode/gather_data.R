# =================================================================================
# This code uses google sheets to store the position info
if(using_googlesheets){
  
  library(googlesheets4)
  
  # load/refresh existing credentials, if available
  # otherwise, go to browser for authentication and authorization
  gs4_auth()
  
  if(sheet_is_publicly_readable){
    # This tells google sheets to not try and authenticate. Note that this will only
    # work if your sheet has sharing set to "anyone with link can view"
    sheets_deauth()
  } else {
    # If info is in a public sheet there's no need to do authentication but if you want
    # to use a private sheet, then this is the way you need to do it.
    # designate project-specific cache so we can render Rmd without problems
    options(gargle_oauth_cache = ".secrets")
    
  }
  
  position_data <- read_sheet(positions_sheet_loc, sheet = "positions")
  skills        <- read_sheet(positions_sheet_loc, sheet = "language_skills")
  text_blocks   <- read_sheet(positions_sheet_loc, sheet = "text_blocks")
  contact_info  <- read_sheet(positions_sheet_loc, sheet = "contact_info", skip = 1)
  
} else {
  
  position_data <- read_csv("csvs/positions.csv")
  skills        <- read_csv("csvs/language_skills.csv")
  text_blocks   <- read_csv("csvs/text_blocks.csv")
  contact_info  <- read_csv("csvs/contact_info.csv", skip = 1)
  
  # Add data in brazilian portuguese
  position_data_ptbr <- read_csv("csvs/positions_ptbr.csv")
  skills_ptbr        <- read_csv("csvs/language_skills_ptbr.csv")
  text_blocks_ptbr   <- read_csv("csvs/text_blocks_ptbr.csv")
  contact_info_ptbr  <- read_csv("csvs/contact_info_ptbr.csv", skip = 1)
  
}

