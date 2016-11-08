install.packages("XLConnect")
require("XLConnect")
wb <- loadWorkbook("Forbes-2004.xls")
df <- readWorksheet(wb, "Sheet1")

## Task 2a
df[1:10,]
# Rank             Company        Country Employees
# 1     1           Citigroup  United States    250000
# 2     2    General Electric  United States    315000
# 3     3 American Intl Group  United States     80000
# 4     4          ExxonMobil  United States     92500
# 5     5                  BP United Kingdom    115250
# 6     6     Bank of America  United States    133549
# 7     7          HSBC Group United Kingdom    184405
# 8     8        Toyota Motor          Japan    264096
# 9     9          Fannie Mae  United States      4800
# 10   10     Wal-Mart Stores  United States   1400000

## Task 2b i
df_us <- subset(df, Country == "United States")
median(df_us$Employees)
# 12655

## Task 2b ii
df_non_us <- subset(df, Country != "United States")
median(df_non_us$Employees, na.rm = TRUE) # cause there are blank values
# 14600

## Task 2b iii
df_fr_or_de = subset(df, Country == "France" | Country == "Germany")
median(df_fr_or_de$Employees, na.rm = TRUE) # cause there are blank values
# 36123.5

## Task 2c
df_de = subset(df, Country == "Germany" & Employees > 5000)
df_de$Company
# [1] "DaimlerChrysler"         "Deutsche Bank Group"     "Siemens Group"          
# [4] "Deutsche Post"           "Volkswagen Group"        "Munich Re"              
# [7] "BMW-Bayerische Motor"    "RWE Group"               "BASF Group"             
# [10] "Bayer Group"             "ThyssenKrupp Group"      "Metro AG"               
# [13] "Deutsche Lufthansa"      "Allianz Worldwide"       "Deutsche Telekom"       
# [16] "SAP"                     "Henkel Group"            "E.On"                   
# [19] "Degussa"                 "HVB-HypoVereinsbank"     "Commerzbank"            
# [22] "Porsche"                 "EnBW-Energie Baden"      "Linde"                  
# [25] "Vattenfall Europe"       "Schering Group"          "Merck"                  
# [28] "M A N Group"             "Continental"             "HeidelbergCement"       
# [31] "Celesio"                 "Beiersdorf"              "adidas-Salomon"         
# [34] "KarstadtQuelle"          "Infineon Technologies"   "TUI Group"              
# [37] "Fresenius"               "BHW Holding"             "Südzucker"              
# [40] "Bankgesellschaft Berlin" "Altana"                  "W&W-Wüstenrot"          
# [43] "mg technologies"         "Rheinmetall"             "Hochtief"               
# [46] "Celanese"                "Nürnberger Beteiligungs" "Bilfinger & Berger"     
# [49] "Buderus"                 "Salzgitter"              "AVA"                    
# [52] "SPAR Handels"            "Springer (Axel)"         "BayWa"   

## Task 2d
head(df[order(-df$Employees),], 10)

# Rank                    Company        Country Employees
# 10    10            Wal-Mart Stores  United States   1400000
# 55    55                 PetroChina          China    422554
# 81    81 China Petroleum & Chemical          China    418871
# 35    35              Siemens Group        Germany    417000
# 174  174                 McDonald's  United States    413000
# 341  341              Compass Group United Kingdom    412574
# 88    88            Carrefour Group         France    396662
# 21    21            DaimlerChrysler        Germany    370677
# 94    94      United Parcel Service  United States    360000
# 75    75                 Ford Motor  United States    350321
