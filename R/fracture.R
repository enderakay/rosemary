# https://www.flickr.com/photos/stringrbelle/49297357231

#' @rdname rosemary
#' @export
fracture <- function(dir = NULL, ...) {

  dir <- check_dir(dir)
  file <- file.path(dir, "fracture.png")

  set.seed(181)
  pic <- jasmines::scene_mix(n = 100, xpos = (1:20)*.5, ypos = (1:20)*.5,
                             entity = "line", grain = 200, size = 3) %>%
    jasmines::unfold_slice(seed = 181, iterations = 20) %>%
    dplyr::mutate(order = id) %>%
    jasmines::style_ribbon(
      palette = jasmines::palette_named("lajolla"),
      background = "black",
      alpha_init = .2,
      alpha_decay = .15
    )

  pic <- pic +
    ggplot2::coord_cartesian(xlim= c(.2,.8), ylim = c(.2,.8))

  pic %>% jasmines::export_image(file)

  cat("image written to:", file, "\n")
  return(invisible(NULL))

}
