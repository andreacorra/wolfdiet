#' wolf
#'
#' @param tax species represented using scientific names (TRUE) or common names (FALSE)
#'
#' @export
#'
#' @examples
#' wolf()
#'
wolf <- function(tax=TRUE){
  data(wolfdiet)

  stsp <- colnames(wolfdiet)
  st <- stsp[1:20]
  sp <- stsp[(length(st)+1):(length(stsp)-1)]
  rs <- stsp[length(stsp)]
  if(tax){
    colnames(wolfdiet) <- c(st,as.vector(unlist(lapply(strsplit(sp,'_'),function(x) x[2]))),rs)
  } else {
    colnames(wolfdiet) <- c(st,as.vector(unlist(lapply(strsplit(sp,'_'),function(x) x[1]))),rs)
  }
  return(wolfdiet)
}
