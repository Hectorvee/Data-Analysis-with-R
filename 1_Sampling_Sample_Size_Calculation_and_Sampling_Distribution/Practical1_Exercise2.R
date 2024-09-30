#EXERCISE 2
#set your own working directory

#import and view the ABQ data
ABQ=read.csv("ABQ.csv",header = TRUE)
View(ABQ)

#sort the ABQ data in path order to create the path
ABQorder=ABQ[order(ABQ$path),]
View(ABQorder)

#import the coordinates of the area labels
ABQcoord=read.csv("ABQcoord.csv",header = TRUE)
View(ABQcoord)

#plot the map
plot(ABQ$Lattitude,ABQ$Longitude)
text(x=ABQ$Lattitude,y=ABQ$Longitude,labels=ABQ$path,pos = 3,cex = 0.5)
text(x=ABQcoord$Lattitude,y=ABQcoord$Longitude,labels=ABQcoord$Name,pos=1,cex=0.35,col="blue")
lines(ABQorder$Lattitude,ABQorder$Longitude,col="red")

#select a systematic sample of size n=5 -> k=30/5=6 from the path-ordered data
ABQsys_list=sample(6,1)
for(i in 2:5){
  ABQsys_list[i]=ABQsys_list[i-1]+6
}
ABQsys_list

ABQsys_set=ABQorder[ABQsys_list,]
ABQsys_set

#add the 5 locations selected through systematic sampling to the existing plot
points(ABQsys_set$Lattitude,ABQsys_set$Longitude,col="green",pch=20,cex=1.5)

#select a simple random sample of size 5 from the path-ordered data
ABQsrs_set=ABQorder[sort(sample(nrow(ABQorder),5,replace = FALSE)),]
ABQsrs_set

#add the 5 locations selected through simple random sampling to the existing plot
#it is possible that you selected the sample locations through both methods
#in my samples, I selected location 6 both times 
#to show this on the graph, choose a different plot symbol
points(ABQsrs_set$Lattitude,ABQsrs_set$Longitude,col="purple",pch=8,cex=1.5)
