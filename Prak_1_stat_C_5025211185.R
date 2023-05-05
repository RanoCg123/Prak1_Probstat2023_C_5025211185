#Rano Noumi Sulistyo 5025211185
#probstat c

#1a
#soal menjelaskan bahwa ada 2 kemungkinan yaitu laki atau tidak laki
#oleh karena itu mneggunakan binomial
#P(X=k) = (nCk) p^k (1-p)^(n-k)
#terdapat 10 kelahiran, kemungkinan 0.488 untuk laki

n =  10
p = 0.488
#P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)

#1b
#kita diminta untuk menghitung peluang untuk 3 laki laki, berarti k = 3
#P(X=3) = (10C3) 0.488^k (1-0.488)^(10-3)
cat(dbinom(3, n, p), "\n")
#ans = 0.1286265

#1c
#kita diminta untuk menghitung peluang kurang dari 3 laki laki
#ini berarti jumlah kemungkinan laki 0, 1, dan 2
#kita gunakan pbinom
cat(pbinom(2,n,p,), "\n")
#ans = 0.0636442


#1d
#disini kita perlu menghitung perluang 3 atau lebih dari 3
#berarti kita menggunakan kebalikan dari pbinom 1c
cat((1 - pbinom(2,n,p)), "\n")
#ans = 0.9363558

#1e
#dalam distribusi binomial, nilai harapan adalah np yaitu expected number
cat(n*p, " ")

#sementara nilai simpanagan baku atau standar deviasi adalah akar dari varian
#varian dari binomial adalah npq 
cat(sqrt(n*p*(1-p)), "\n")
#ans = 0.488 dan 1.580683

#1f
#buat gambarnya dengan plot
plot(0:10, dbinom(0:10,n,p),
     type = "h", col ="blue", main="distribusi kenungkinan laki",
     xlab="jumlah laki", ylab="kemungkinan")

#no 2a
#kita diberi 2 hal, rentang waktu dan rata rata kejadian
#distribusi yang memiliki 2 karaktersisasi ini adalah poisson
#rumus = P(X=k) = e^(-λ) (λ^k / k!)
lb = 1.8
y = 20 
# lambda atau rata rata = 1.8 dan terjadi dalam rentang 20 tahun
# rumus  = e^(-1.8) * 1.8^k / k!

#2b
#dilaporkan terjadi 4 kasus dalam kalangan pekerja pabrik ban
#tidak ada spesifik waktu, namun dalam prediksi rata ratanya selama 20 tahun 1.8
#4 labih dari 2x rata rata. sehingga bisa dibilang abnormal
cat(dpois(4,lb), "\n")
#kemungkinan adalah 0.07230173 atau 7% relatif rendah namun menurut saya tidak wajar namun relatif mungkin
#tidak ada detail rentan waktu, sehingga tidak bisa pasti

#2c 
#kemungkinan paling banyak 4 berarti peluang dari 0-4
#menggunakan cumulative density function
cat(ppois(4,lb), "\n")
#ans = 0.9635933

#2d
#kemungkinan lebih dari 4 kasus, berarti kebalikan dari 2c
# 1 - cdf dari kasus 0-4
cat((1-ppois(4,lb)),"\n")
#ans = 0.03640666

#2e 
#dalam distribusi poisson varian dan nilai harapan sama yaitu sesuai dengan lambda
#dalam kasus ini lambda adalah 1.8
cat(lb,  " ")
#dikarenakan standar devisasi adalah akar dari varian maka kita akarkan 1.8
cat(sqrt(lb) , "\n")
#ans = 1.8  dan 1.341641 

#2f
#buat gambar graphnya dalam bentuk histogram, kita gambar dari 1-10 karena lambda 1.8
plot(0:10, dpois(0:10,lb), type="h", col="red", main="distribusi kasus kangker tulang",
     xlab="banyak kasus", ylab="kemungkinan")
#2g
#simulasi dengan beberapa kali denga rpois
#kali ini coba 1000 kali
try = rpois(1000,lambda=lb)

#2h
#bandingkan dengan 2d
cat(mean(try), " ", median(try),
    " ", sd(try),
    " ", var(try),
    "\n")
# avg = 1.813  median = 2 sd = 1.333345 var=1.777809

#3a
xc = 3
df = 10
# chi square memerlukan degree of freedom dan variabel acak
# rumus = f(x) = (1 / (2^(k/2) Γ(k/2))) x^(k/2 - 1) e^(-x/2) untuk x ≥ 0
# df = 10, var acak = 3 
cat(dchisq(xc,df),"\n")
#ans = 0.02353326
#3b
#menngunakan hist dan rchisq
tx <- rchisq(500, df = df )
hist(tx, xlab = "var", ylab = "kasus", main = "Histogram Chi-Square")
#3c 
#rataan dari chi square adalah derajat kebebasannya
#sementara variannya adalah 2 kalinya dari itu
cat(df,  " ")
cat (df*2,"\n")
#4a
num = 100 
mean = 45 
sdn = 5
#kita simulasi
ext <-  rnorm(num,mean,sdn)
mext <- mean(ext)
x1 <- floor(mext)
x2 <- ceiling(mext)
#print z1 dan z2
cat((x1-mext)/sd(ext), " ")
#- 0,03931083
cat((x2-mext)/sd(ext), "\n")
#0.1776456 
prob <- pnorm(x1,mean,sdn) - pnorm(x2,mean,sdn)
cat(prob, "\n")
#-0.07925971
plot(ext, type = "l")
#4b
breaks = 50
hist(ext, breaks, main = "Histogram distribusi normal acak ")
#4c 
cat(var(ext),"\n")
#21.24491 

#5a
# dalam T student kita perly degree dan vektor
# rumus : = Γ((ν+1)/2) / (√(νπ) Γ(ν/2)) (1 + (x^2 / ν))^(-(ν+1)/2) untuk -∞ < x < ∞
# karena kurang dari berarti kumulatif menggunakan p
cat(pt(-2.34, 6), "\n")
#ans = 0.02892197 
#5b
#lebih dari berarti menggunakan 1 - kurang dari kumulatif
cat(1 - pt(1.34, 6), "\n")
#ans = 0.11438 
#5c
# diatas 1.23 dan dibawah -1.23 berarti kumulatif -1.23 dan 1 - kumulatif 1.23
cat(pt(-1.23, 3) + (1 - pt(1.23, 3)), "\n")
#ans = 0.306356 
#5d
# antara 2 berarti kumlatif 0.94 dikurangi kumulatif -0.94
cat( (pt(0.94, 14)) - pt(-0.94, 14), "\n")
#ans = 0.6368457
#5e
#tidak diketahui x, dan diketahui luasan dan derajatnya
#menggunakan qt, sebelah kiri berarti tidak perlu diubah dari format r
cat(qt(0.0333, 5), "\n")
#ans = -2.337342
#5f
# bagian kanan, jadi qt namun 1 - probabilitas
cat(qt(1 - 0.125, 25), "\n")
#ans = 1.177716 
#5g
#diantara dan negatif berarti -t<X<t. berarti 1- prob
#karena kedua ujung sama kita bagi 2
cat(qt(0.75 + (1-0.75)/2, 11 ), "\n")
#ans = 1.21446
#5h
# di luar dan negatif berarti X<-t dan X>t. berarti 1 - prob/2
# aga
cat(qt(1 - (0.0333/2), 23 ), "\n")
#ans = 2.264201