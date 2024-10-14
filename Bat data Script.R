#Anabat aid
#Purpose of code is to aid with identification of Missouri Bat species using information provided by Anabat data.
#code acts as a workflow to limit potential species down to one or two species for easier identifying

#Pipeline (use this to read the code and run the program)
mainFunction()

#initializing functions

mainFunction <- function(){
  cat("Note: this program only works with Northern, Gray, Red, Little Brown and Indianna species")
  seconds <- readline(prompt ="Are calls spaced ~.1 sec (@every dash when zoomed at F4)? y/n:  ")
  condit <- 0
  if(seconds == "y"){
    F1(condit)
  }else{
    F3(condit)
  }
  
}
F1 <- function(condit){
  bottom <- readline(prompt = "Does most of the data (mainly in red) end around the 40 mark? y/n: ")
  if(bottom == "y"){
    F2()
  }else if(bottom == "n" & condit < 1){
    condit <- condit + 1
    F3(condit)
  }else{
    cat("possible gray: review data manually")
  }
  }

F2 <- function(){
  
  straight <- readline(promp = "is the data fairly straight up and down with only slight knee heel toe? y/n:  ")
  if(straight == "y"){
    cat("Northern")
  }else{
    F4()
  }
}

F3 <- function(condit){
 
  longneckandtail <- readline(prompt =  "does the data show a long neck AND tail? y/n: ")
  if(longneckandtail == "y"){
    cat("Likely gray: Manual identification encouraged")
  }else{
        tail <- readline(prompt = "does the data have a tail? y/n: ")
      if(tail == "y" & condit >= 1){
        cat("Possible gray: Manual identification needed")
        
      }else if(tail == "y" & condit < 1){
        condit <-  condit + 1
        F1(condit)
      }else{
      cat("Red")
        condit
      }
    }
}

F4 <- function(){
  gradient <- readline(prompt = "Is there a consistent gradient in call power from low to high? y/n: ")
  Sc <- readline(prompt = "Is the Sc value generally higher than 100? y/n: ")
  if(gradient == "y" & Sc == "n"){
    cat("Little Brown")
  }else if(gradient == "n" & Sc == "y"){
    cat("Indianna")
  }else{
    cat("Possibly Little brown or Indianna: Manual analysis required")
  }
}
