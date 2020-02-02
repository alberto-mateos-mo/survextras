intro_surv <- function(df, times, event, interactive = TRUE){

  require(manipulate)
  require(dplyr)
  require(ggplot2)

  pos_t <- df[,which(names(df) == times)]
  pos_e <- df[,which(names(df) == event)]

  if (interactive == TRUE) {
    manipulate({
      data.frame(pos_t,
                 pos_e) %>%
        sample_n(n) %>%
        ggplot()+
        geom_linerange(aes(x = 1:n, ymin = 0, ymax = pos_t),
                       linetype = "dotdash",
                       colour = "gray30")+
        geom_point(aes(x = 1:n, y = pos_t,
                       shape = pos_e %>% as.factor(),
                       colour = pos_e %>% as.factor()),
                   size = 4)+
        coord_flip()+
        theme_classic()+
        labs(x = "", y = "Times")+
        scale_shape_manual("Event", values = c("/", "x"))+
        scale_color_manual("Event", values = c("dodgerblue4", "darkred"))+
        ggtitle("Survival times plot")

    },
    n = slider(min = 10, max = 50, initial = 10)
    )
  }
  if (interactive == FALSE) {
    data.frame(pos_t,
               pos_e) %>%
      sample_n(25) %>%
      ggplot()+
      geom_linerange(aes(x = 1:25, ymin = 0, ymax = pos_t),
                     linetype = "dotdash",
                     colour = "gray30")+
      geom_point(aes(x = 1:25, y = pos_t,
                     shape = pos_e %>% as.factor(),
                     colour = pos_e %>% as.factor()),
                 size = 4)+
      coord_flip()+
      theme_classic()+
      labs(x = "", y = "Times")+
      scale_shape_manual("Event", values = c("/", "x"))+
      scale_color_manual("Event", values = c("dodgerblue4", "darkred"))+
      ggtitle("Survival times plot")
  }

}
