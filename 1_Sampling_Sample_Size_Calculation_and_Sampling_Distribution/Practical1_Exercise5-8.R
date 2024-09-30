#EXERCISE 5
CI_input=c(90,95,99)
Sigma_input=c(10,15,20)
n_output=matrix(0,nrow=length(Sigma_input),ncol = length(CI_input))

for(i in 1:length(Sigma_input)){
  for(j in 1:length(CI_input)){
    n_output[i,j]=(qnorm((1-CI_input[j]/100)/2)*Sigma_input[i]/3)^2
  }
}

rownames(n_output)=c("Sigma=10","Sigma=15","Sigma=20")
colnames(n_output)=c("90% CI","95% CI","99% CI")
ceiling(n_output)

#EXERCISE 6
n_Calc=function(p,CI,e,N,FPC=0){
  n0=p*(1-p)*(qnorm((1-CI/100)/2)/e)^2
  print(n0)
  if(FPC==1){
    n=ceiling(n0/(1+n0/N))
    FPCcomment="FPC used"
  }else{
    n=ceiling(n0)
    FPCcomment="FPC not used"
  }
print.noquote(c(FPCcomment,n))
}

n_Calc(p=0.5,CI=95,e=0.03,N=1251,FPC=0)
n_Calc(p=0.5,CI=95,e=0.03,N=1251,FPC=1)

#EXERCISE 7
EffectSize=(100-95)/9.8

#this is a one-sided test to the right
pwr.t.test(d=EffectSize,sig.level=0.05,power=0.8,type="one.sample",
           alternative="greater")

#if we tested for any difference, it would be a two sided test
pwr.t.test(d=EffectSize,sig.level=0.05,power=0.8,type="one.sample",
           alternative="two.sided")

#testing one-sided to the left shows an error since the effect size is positive
pwr.t.test(d=EffectSize,sig.level=0.05,power=0.8,type="one.sample",
           alternative="less")


#EXERCISE 7
#calculate the effect size using the given information
h=ES.h(0.13,0.1)
h
pwr.p.test(h = h, sig.level = 0.01, power = 0.85,
           alternative = "two.sided")

#specify small effect size: h=0.2
pwr.p.test(h = 0.2, sig.level = 0.05, power = 0.9,
           alternative = "two.sided")

#specify medium effect size: h=0.5
pwr.p.test(h = 0.5, sig.level = 0.05, power = 0.9,
           alternative = "two.sided")

#specify large effect size: h=0.8
pwr.p.test(h = 0.8, sig.level = 0.05, power = 0.9,
           alternative = "two.sided")

