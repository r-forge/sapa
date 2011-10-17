########################################################
## S+SAPA library attachment/detachment functions
##
##  .First.lib
##  .Last.lib
##
########################################################
###
# .First.lib
###
.First.lib <- function(library , section)
{
	if (!is.R()) {
	  ifultools.pos <- attached.where("ifultools", nomatch=0)
	  if (!ifultools.pos) {
	    cat("Loading required library: ifultools.\n")
	    library("ifultools", first=TRUE)
	    assign("ifultools.previously.sapa.loaded", TRUE, frame=0)
	  }
	} else {
		library.dynam(section, section, library)
	}
  invisible(NULL)
}

###
# .Last.lib
###
if (!is.R()) 
{
	.Last.lib <- function(library , section , .data , where)
	{
	  # ifultools library
	  ifultools.id <- "ifultools.previously.sapa.loaded"
	  if (exists(ifultools.id, frame=0)){
	    was.loaded <- get(ifultools.id, frame=0)
	    if (was.loaded && attached.where("ifultools", nomatch=0)){
	      cat("Detaching library: ifultools.\n")
	      detach("ifultools")
	    }
	    remove(ifultools.id, frame=0)
	  } 
	  invisible(NULL)
	}
}
