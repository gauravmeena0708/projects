#Type of objects
#character
#numeric
#integer
#complex
#logical
#1L is integer specifically
#Inf is infinity
#NaN is not a number

#attributes
#name, dimnames, dimensions, class, length
x <- c(T,F)
x
y<- c(1+1i, 2+3i)
y

#conversion
as.character(y)
z<-as.integer(y)


#list can have items of diff types
a<- list(1, "String")
a

#matrices
nat <- matrix(nrow=2,ncol=3)
nat
attributes(nat) #attributes gives attributes
dim(nat)        #dim is one attribute matrcies have

mat <- matrix(1:6, nrow=2,ncol=3)
mat

#factor
f <- factor(c("Male","Female","Male"))
f
attributes(f)
levels(f)

table(x)
table(f)

f1 <-factor(c("Male","Female","Male"),levels = c("Male","Female"))
f1

#na, nan functions
is.na(f)
is.nan(f)

#dataframes
#either create by read.table, read.csv
#or
df <- data.frame(foo=1:4,bar=c(T,F,T,F))
df
attributes(df)
names(df)
row.names(df)
nrow(df)
ncol(df)

#names
x <-1:3
x
names(x) <- c("foo","bar","bla")
x

y <- list(a=1,b=2,c=3)
y$a
y$b

#read.
read.table("file.name",header=F,nrows = 2)
read.csv("file.csv")
x<-data.frame(a=1,b=2)
y<-list(c=3,d=4)
dput(x)
dput(x,"x.R")
new<-dget("x.R")
new
#dump functioncan be used for multiple objects
dump(c("x","y"),"data.R")
source("data.R")
x
y

#connections
#file, gzfile, bzfile,url
#same as read.csv, read.table but in deep
con<-gzfile("file.gz")
x<-readLines(con,10)
x

#subsetting
x <- c("a","b","a","c","d","c")
x[2]
x[1:4]
x[x>"a"]
u <- x>"a"
u

x<- list(foo=1:4, bar=0.6, baz=1:6)
x
x[c(1,3)]
x$baz
name<-"foo"
x[[name]] #[[]] can be used for assigned variable
x[[2]][[1]] #specific position
x[[c(2,1)]]

#matrix
x<-matrix(1:6,2,3)
x[1,2]
x[1,]
x[,1]

#removing NA
x<-c(1,2,NA,4,5)
good<-complete.cases(x)
good
x[good]
x<-2
if(x>3){
  print("greater")
} else {
  print("lesser")
}

for(i in 1:10){
  print(i)
}
y<-c("a","b")
for(i in seq_along(y)){
  print(y[i])
}

#while
count<-0
while(count<10){
  print(count)
  count<- count+1
}

z<-5
i<-1
while(z>=3 && z<=10){
  print(paste(as.character(i),as.character(z)))
  i<-i+1
  coin <-rbinom(1,1,0.5)
  if(coin==1){
    z<-z+1
  } else {
    z<-z-1
  }
}

#repeat, break
#simlar to while(1)
#next is skip


#function
add2 <- function(x,y){
  x+y
}
print(add2(1,2))

above10 <-function(x){
  x[x>10]
}
above10(1:13)

above <-function(x,n=10){
  x[x>n]
}
above(1:13,5)
above(1:13)

columnmean <- function(y, removeNA=T){
  nc<-ncol(y)
  means<-numeric(nc)
  for (i in 1:nc){
    means[i]<-mean(y[,i],na.rm=removeNA)
  }
  means
}
columnmean(airquality)


#extending functions
x<-function(x, y, type="l",...){
  plot(x,y,type,...)
}

#this is how read.table converts into read.csv
args(x)
args(paste)
args(cat)

#R returns function
make.power<-function(n){
  pow<-function(x){
    x^n
  }
}
cube <-make.power(3)
square <-make.power(2)
cube(5)
square(5)

ls(environment(cube))
get("n",environment(cube))
get("n",environment(square))

#date and time
x<-as.Date("1970-01-02")
x
unclass(x)

y<- Sys.time()
p<-as.POSIXlt(y)
names(unclass(p))
p$sec
p$min
p$mon
p$year


dates<-c("January 29, 2021 10:40","December 21, 2021 10:40")
z<-strptime(dates,"%B %d, %Y %H:%M")
z

#loop functions
#lapply, sapply, apply, tapply, mapply

x<-list(a=1:5, b=1:10, c=rnorm(10))
lapply(x,mean)
lapply(x,runif)
lapply(x,runif, min=0, max=10)
 
x<-matrix(rnorm(200),20,10)
apply(x,1, mean)
apply(x,2,sum)
#rowSums, rowMeans colSums colMeans


#debugging tools

#traceback, debug, browser, trace, recover


#random numbers
#dnorm, pnorm, rnorm, qnorm