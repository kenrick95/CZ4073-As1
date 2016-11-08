df1 = data.frame(CustomerId=c(1:6), Product=c(rep("Toaster",3), rep("Radio",3)))
df2 = data.frame(Id=c(2,4,6,9), State=c(rep("Alabama",2), rep("Ohio",1), rep("Mexico",1)))
merge(x = df1, y = df2, by.x="CustomerId", by.y="Id", all.x=TRUE)

leftJoinTwoDataFrames <- function (x, y, by.x, by.y) {
  stopifnot(is.data.frame(x))
  stopifnot(is.data.frame(y))
  
  cx <- c(t(x[by.x]))
  cy <- c(t(y[by.y]))
  y_idx = match(cx, cy)
  
  y_new_names <- names(y)
  y_new_names <- y_new_names[!y_new_names == by.y] # Exclude "by.y" to appear in final result
  
  result <- cbind(x, y[y_idx, y_new_names])
  if(length(y_new_names) == 1) { # because when y_new_names are single, the result will include the string "y_new_names" as the colum name
    names(result)[names(result)=="y[y_idx, y_new_names]"] <- y_new_names[1]
  }
  row.names(result) <- 1:nrow(result)
  
  result
}
leftJoinTwoDataFrames(x = df1, y = df2, by.x="CustomerId", by.y="Id")
