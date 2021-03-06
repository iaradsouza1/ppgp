#' Retrieve informations about STRINGdb organisms
#'
#' @param domain Filter the returned data.frame by one of each domain ("bacteria", "eukaryota" and "archaea")
#' or retrieve all domains (default).
#'
#' @return
#' @export
#'
#' @examples
format_ssp <- function(domain = "all") {
    if(!require("STRINGdb")) {
      BiocInstaller::biocLite("STRINGdb")
      library("STRINGdb")
    } else {
      library("STRINGdb", character.only = T)
    }
    if (!is.character(domain)) {
        stop("Provide 'all', 'eukaryota', or 'bacteria' domains.", call. = F)
    }
    library(STRINGdb)
    if ("all" %in% domain) {
        sp <- get_STRING_species()
        sp <- sp[,c(1,2,4)]
        colnames(sp) <- c("ssp_id", "ssp_name", "domain")
        sp
    } else {
        sp <- get_STRING_species()
        sp <- sp[sp$kingdom %in% domain,]
        sp <- sp[,c(1,2,4)]
        colnames(sp) <- c("ssp_id", "ssp_name", "domain")
        sp
    }
}
