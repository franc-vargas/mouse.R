auto.mouse.move <- function(minutes = 20){
  # This script only works for windows! 
  all_packages <- installed.packages()
  required_packages <- c("tcltk", 
                         "KeyboardSimulator",
                         "beepr")
  
  missing_packages <- required_packages[!required_packages %in% all_packages]
  
  # This part installs missing packages
  if(length(all_packages) > 0){
    install.packages(missing_packages)
  }
  
  sleep_time <- 30
  max_iterations <- minutes*2
  # Create a vector, you could just re-write x and y within loop instead
  x <- vector(mode = "integer", length = max_iterations)
  y <- vector(mode = "integer", length = max_iterations)

  win1 <- tcltk::tktoplevel()
  butStop <- tcltk::tkbutton(win1, text = "Stop",
                             width = 80,
                             height = 20,
                             bg = "grey", 
                      command = function() {
                        assign("stoploop",
                               TRUE, 
                               envir = .GlobalEnv)
                        tcltk::tkdestroy(win1)
                      })
  tcltk::tkgrid(butStop)
  
  i <- 1
  
  stoploop <<- FALSE # modifies stoploop variable at global level
  
  cat("start time: ",  format(Sys.time(), "%H:%M:%S"), "\n")
  
  while(!stoploop){
    # cat("iteration = ", i, "\n", "time = ", format(Sys.time(), "%H:%M:%S"), "\n",
    #   "stoploop_value = ", stoploop, "\n")
    x[i] <- round(runif(1, 0, 1800),0) # if re-writing, just use x <- .....
    y[i] <- round(runif(1, 0, 900), 0) # if re-writing, just use y <- .....
    # replace x[i] and y[i] with just x and y if re-writing same variable
    KeyboardSimulator::mouse.move(x[i], y[i], duration=0.5)
    
    # press twice the numlock, otherwise you'll sometimes stop the loop and 
    # it will be deactivated
    KeyboardSimulator::keybd.press("numlock")
    KeyboardSimulator::keybd.press("numlock")

    i <- i+1
 
    Sys.sleep(sleep_time)
    if(stoploop || i > max_iterations){break}
  }
  cat("end time: ",  format(Sys.time(), "%H:%M:%S"))
  
  tcltk::tkdestroy(win1)
  beepr::beep(5)
  
}
