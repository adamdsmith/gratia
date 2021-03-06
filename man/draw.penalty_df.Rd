% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw-methods.R
\name{draw.penalty_df}
\alias{draw.penalty_df}
\title{Display penalty matrices of smooths using \code{ggplot}}
\usage{
\method{draw}{penalty_df}(
  object,
  normalize = FALSE,
  continuous_fill = NULL,
  xlab = NULL,
  ylab = NULL,
  title = NULL,
  subtitle = NULL,
  caption = NULL,
  ncol = NULL,
  nrow = NULL,
  guides = "keep",
  ...
)
}
\arguments{
\item{object}{an object, the result of a call to \code{\link[=evaluate_smooth]{evaluate_smooth()}}.}

\item{normalize}{logical; normalize the penalty to the range -1, 1?}

\item{continuous_fill}{suitable scale used for the filled surface. If \code{NULL},
the default used is \code{scale_fill_distiller(palette = "RdBu", type = "div")}.}

\item{xlab}{character or expression; the label for the x axis. If not
supplied, no axis label will be drawn. May be a vector, one per penalty.}

\item{ylab}{character or expression; the label for the y axis.  If not
supplied, no axis label will be drawn. May be a vector, one per penalty.}

\item{title}{character or expression; the title for the plot. See
\code{\link[ggplot2:labs]{ggplot2::labs()}}. May be a vector, one per penalty.}

\item{subtitle}{character or expression; the subtitle for the plot. See
\code{\link[ggplot2:labs]{ggplot2::labs()}}. May be a vector, one per penalty.}

\item{caption}{character or expression; the plot caption. See
\code{\link[ggplot2:labs]{ggplot2::labs()}}. May be a vector, one per penalty.}

\item{ncol, nrow}{numeric; the numbers of rows and columns over which to
spread the plots.}

\item{guides}{character; one of \code{"keep"} (the default), \code{"collect"}, or
\code{"auto"}. Passed to \code{\link[patchwork:plot_layout]{patchwork::plot_layout()}}}

\item{...}{arguments passed to other methods.}
}
\description{
Displays the penalty matrices of smooths as a heatmap using \code{ggplot}
}
\examples{
load_mgcv()
dat <- data_sim("eg4", n = 400, seed = 42)
m <- gam(y ~ s(x0) + s(x1, bs = 'cr') + s(x2, bs = 'bs', by = fac),
         data = dat, method = "REML")

## produce a multi-panel plot of all penalties
draw(penalty(m))

# for a specific smooth
draw(penalty(m, smooth = "s(x2):fac1"))
}
