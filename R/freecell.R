# https://www.flickr.com/photos/stringrbelle/49279413587

#' @rdname rosemary
#' @export
freecell <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "freecell.png")

  cols <- jasmines::palette_named("berlin")
  pal <- function(n, alpha = 1, ...) {
    c("#dddddd", cols(n = n-1, alpha = alpha, ...))
  }

  dat <- jasmines::entity_heart(1000, id =  1) %>%
    dplyr::mutate(x = x * 1.5, y = y * 1.5) %>%
    jasmines::unfold_tempest(iterations = 500, scale = .005, seed = 1) %>%
    jasmines::unfold_inside() %>%
    dplyr::mutate(
      order = (inside == 1) * base::rank(
        ambient::gen_worley(x, y, seed = 1, value = "cell")
      )
    )

  pic <- dat %>%
    jasmines::style_ribbon(
      palette = pal,
      background = "ghostwhite",
      seed_col = "#ffffff44",
      alpha_init = .8,
      alpha_decay = .001
    )

  pic <- pic +
    ggplot2::coord_cartesian(
      xlim = c(.25, .6), ylim = c(.25, .6))

  pic %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))
}


