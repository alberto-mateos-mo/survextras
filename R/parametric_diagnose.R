parametric_diagnose <- function(modelo_km, type = "side-by-side"){

  require(ggplot2)
  require(scales)

  gg_exp <- ggplot()+
    geom_point(aes(log(modelo_km$surv), modelo_km$time))+
    labs(x = expression(bar(S)(t)), y = "t",
         title = "Exponential diagnosis",
         subtitle = "Straigth line with negative slope expected")+
    theme(plot.subtitle = element_text(family = "serif"),
          plot.caption = element_text(family = "mono"),
          axis.line = element_line(size = 0.5,
                                   linetype = "solid"),
          axis.ticks = element_line(colour = "gray0",
                                    size = 0.8),
          panel.grid.major = element_line(colour = "gray90",
                                          linetype = "dashed"),
          panel.grid.minor = element_line(colour = "gray90",
                                          linetype = "dashed"),
          axis.text = element_text(family = "mono"),
          axis.text.x = element_text(family = "mono"),
          axis.text.y = element_text(family = "mono"),
          panel.background = element_rect(fill = NA,
                                          linetype = "solid"),
          plot.background = element_rect(fill = "white"))

  gg_wei <- ggplot()+
    geom_point(aes(log(-log(modelo_km$surv)), log(modelo_km$time)))+
    labs(x = expression(bar(S)(t)), y = "t",
         title = "Weibull diagnosis",
         subtitle = "Straigth line with positive slope expected")+
    theme(plot.subtitle = element_text(family = "serif"),
          plot.caption = element_text(family = "mono"),
          axis.line = element_line(size = 0.5,
                                   linetype = "solid"),
          axis.ticks = element_line(colour = "gray0",
                                    size = 0.8),
          panel.grid.major = element_line(colour = "gray90",
                                          linetype = "dashed"),
          panel.grid.minor = element_line(colour = "gray90",
                                          linetype = "dashed"),
          axis.text = element_text(family = "mono"),
          axis.text.x = element_text(family = "mono"),
          axis.text.y = element_text(family = "mono"),
          panel.background = element_rect(fill = NA,
                                          linetype = "solid"),
          plot.background = element_rect(fill = "white"))

  gg_ln <- ggplot()+
    geom_point(aes(1-modelo_km$surv, log(modelo_km$time)))+
    scale_x_continuous(trans = probability_trans("norm"))+
    labs(x = expression(bar(S)(t)), y = "t",
         title = "Lognormal diagnosis",
         subtitle = "Straigth line with positive slope expected")+
    theme(plot.subtitle = element_text(family = "serif"),
          plot.caption = element_text(family = "mono"),
          axis.line = element_line(size = 0.5,
                                   linetype = "solid"),
          axis.ticks = element_line(colour = "gray0",
                                    size = 0.8),
          panel.grid.major = element_line(colour = "gray90",
                                          linetype = "dashed"),
          panel.grid.minor = element_line(colour = "gray90",
                                          linetype = "dashed"),
          axis.text = element_text(family = "mono"),
          axis.text.x = element_text(family = "mono"),
          axis.text.y = element_text(family = "mono"),
          panel.background = element_rect(fill = NA,
                                          linetype = "solid"),
          plot.background = element_rect(fill = "white"))

  gg_gomp <- ggplot()+
    geom_point(aes(log(-log(modelo_km$surv)+1), modelo_km$time))+
    labs(x = expression(bar(S)(t)), y = "t",
         title = "Gompertz diagnosis",
         subtitle = "Straigth line with positive slope expected")+
    theme(plot.subtitle = element_text(family = "serif"),
          plot.caption = element_text(family = "mono"),
          axis.line = element_line(size = 0.5,
                                   linetype = "solid"),
          axis.ticks = element_line(colour = "gray0",
                                    size = 0.8),
          panel.grid.major = element_line(colour = "gray90",
                                          linetype = "dashed"),
          panel.grid.minor = element_line(colour = "gray90",
                                          linetype = "dashed"),
          axis.text = element_text(family = "mono"),
          axis.text.x = element_text(family = "mono"),
          axis.text.y = element_text(family = "mono"),
          panel.background = element_rect(fill = NA,
                                          linetype = "solid"),
          plot.background = element_rect(fill = "white"))

  gg_llog <- ggplot()+
    geom_point(aes(log((1/modelo_km$surv)-1), log(modelo_km$time)))+
    labs(x = expression(bar(S)(t)), y = "t",
         title = "Log-logistic diagnosis",
         subtitle = "Straigth line with positive slope expected")+
    theme(plot.subtitle = element_text(family = "serif"),
          plot.caption = element_text(family = "mono"),
          axis.line = element_line(size = 0.5,
                                   linetype = "solid"),
          axis.ticks = element_line(colour = "gray0",
                                    size = 0.8),
          panel.grid.major = element_line(colour = "gray90",
                                          linetype = "dashed"),
          panel.grid.minor = element_line(colour = "gray90",
                                          linetype = "dashed"),
          axis.text = element_text(family = "mono"),
          axis.text.x = element_text(family = "mono"),
          axis.text.y = element_text(family = "mono"),
          panel.background = element_rect(fill = NA,
                                          linetype = "solid"),
          plot.background = element_rect(fill = "white"))

  if (type == "side-by-side") {
    multiplot(gg_exp, gg_wei, gg_ln, gg_gomp, gg_llog, cols = 2)
  }

  if (type == "one-by-one") {
    cat ("Press [enter] to start showing plots")
    line <- readline()
    plot(gg_exp)
    cat ("Press [enter] to show next plot")
    line <- readline()
    plot(gg_wei)
    cat ("Press [enter] to show next plot")
    line <- readline()
    plot(gg_ln)
    cat ("Press [enter] to show next plot")
    line <- readline()
    plot(gg_gomp)
    cat ("Press [enter] to show next plot")
    line <- readline()
    plot(gg_llog)
  }

}
