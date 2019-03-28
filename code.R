#To install postgreSQL, visit: https://www.postgresql.org/

#Helped with the initial creation of database
#http://www.postgresqltutorial.com/load-postgresql-sample-database/\
#http://www.postgresqltutorial.com/postgresql-data-types/
#http://www.postgresqltutorial.com/postgresql-create-table/

#Code is based on a tutorial from the link below:
##https://www.r-bloggers.com/getting-started-with-postgresql-in-r/

#uses mtcars dataset to create database
df <- data.frame(carname = rownames(mtcars), 
                 mtcars, 
                 row.names = NULL)
df$carname <- as.character(df$carname)
rm(mtcars)


#Helped with connecting to database
#https://www.youtube.com/watch?v=9OSB9pmlJpI
library(RPostgreSQL)
drive <- dbDriver('PostgreSQL')

#input correct database information
con <- DBI::dbConnect(drive, 
                      dbname = '',
                      host = '',
                      port = , user = '',
                      password = '')

#checks if table exist, if not, create table
dbExistsTable(con, 'cars')

#creates table, cars with data from mtcars
dbWriteTable(con, 'cars', 
             value = df, 
             row.names = FALSE, 
             append = TRUE)

#Query all of the data from the database
df_posgre <- dbGetQuery(con, 'SELECT * from cars')

#Close connection
dbDisconnect(con)
dbUnloadDriver(drive)
