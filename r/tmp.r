if(FALSE){
}





if(FALSE){
# データの読み込み
sake <- read.table("./sake_dataJ.txt", header=T, row.names=1)
names(sake) <- c("日本酒","焼酎","ビール","ワイン","ウイスキー")

# データ間のユークリッド距離を算出
distance <- dist(sake)
# ウォード法を用いてクラスタ間の距離を算出
cluster <- hclust(distance, method="ward.D2")
# ヒートマップを表示
heatmap(as.matrix(sake), Rowv=as.dendrogram(cluster), col=colorRampPalette(c("white", "purple"))(256), margin=c(4,0), cexCol=0.8, cexRow=0.7)
}


if(FALSE){
1 + 2
a <- 3
comment(a) <- "komeeento"
comment(a)
b <- 4
comment(b)
a + b
s <- "asdffs"
s
# Sys.getlocale()
n <- "ddd"
n
}

