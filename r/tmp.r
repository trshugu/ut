if(FALSE){
}





if(FALSE){
# �f�[�^�̓ǂݍ���
sake <- read.table("./sake_dataJ.txt", header=T, row.names=1)
names(sake) <- c("���{��","�Ē�","�r�[��","���C��","�E�C�X�L�[")

# �f�[�^�Ԃ̃��[�N���b�h�������Z�o
distance <- dist(sake)
# �E�H�[�h�@��p���ăN���X�^�Ԃ̋������Z�o
cluster <- hclust(distance, method="ward.D2")
# �q�[�g�}�b�v��\��
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

