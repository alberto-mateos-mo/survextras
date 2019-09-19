max_diff_time <- function(ajuste) {

  require(ggplot2)
  require(dplyr)
  require(grid)

  f   <- ajuste$strata[1]
  ff  <- length(ajuste$surv)
  sp0 <- approxfun(ajuste$surv[1:f], ajuste$time[1:f])
  sp0_a <- approx(ajuste$surv[1:f], ajuste$time[1:f])
  sp1 <- approxfun(ajuste$surv[f+1:ff], ajuste$time[f+1:ff])
  sp1_a <- approx(ajuste$surv[f+1:ff], ajuste$time[f+1:ff])

  dif <- vector(mode = "numeric", length = 10000)
  s   <- seq(0.5,1,length.out = 10000)

  for (i in seq_along(s)) {

    dif[i] <- abs(sp0(s[i])-sp1(s[i]))

  }


  dif2 <- na.omit(dif)

  plot(ajuste$time[1:f], ajuste$surv[1:f], type = "l", col = "darkblue",
       main = paste("Max distance \n between curves:", max(dif2) %>% round(2)),
       xlab = "Time", ylab = "Survival Prob",
       ylim = c(0,1),
       bty = "n")
  grid.text(label = "Plot designed by: \n David Mateos" ,
            x = unit(1,"npc") - unit(2, "mm"),
            y= unit(2, "mm"),
            just=c("right", "bottom"),
            gp=gpar(cex= 0.7, col=grey(0.5)))
  #plot(ajuste)
  lines(ajuste$time[f+1:ff], ajuste$surv[f+1:ff], col = "red")
  abline(v = sp0(s[which.max(dif)]), lty = 2, col = "grey")
  abline(v = sp1(s[which.max(dif)]), lty = 2, col = "grey")
  abline(h = s[which.max(dif)], lty = 2, col = "grey")
  legend(x = summary(ajuste$time)[1],
         y = 0.2,
         legend = names(ajuste$strata)[1], col = "darkblue",
         lty = 1,
         cex = 0.8, bty = "n")
  legend(x = summary(ajuste$time)[1],
         y = 0.1,
         legend = names(ajuste$strata)[2], col = "red",
         lty = 1,
         cex = 0.8, bty = "n")

    # ggplot()+
    # geom_line(aes(ajuste$time[1:f], ajuste$surv[1:f]), colour = "red")+
    # geom_line(aes(ajuste$time[f+1:ff], ajuste$surv[f+1:ff]), colour = "blue")+
    # geom_vline(aes(xintercept = sp0(s[which.max(dif)])), linetype = "dashed", colour = "grey")+
    # geom_vline(aes(xintercept = sp1(s[which.max(dif)])), linetype = "dashed", colour = "grey")+
    # geom_hline(aes(yintercept = s[which.max(dif)]), linetype = "dashed", colour = "grey")+
    # geom_segment(aes(x = summary(ajuste$time)[1], xend = summary(ajuste$time)[1]+summary(ajuste$time)[2],
    #                  y = 0.2, yend = 0.2))

}
