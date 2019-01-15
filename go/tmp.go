package main

import "fmt"
func tmp() {
fmt.Printf("init\n");





}





/*
import(
  "fmt"
  // "time"
  // "net/http"
  // "github.com/gin-gonic/gin"
  // "log"
)
// import "strings"

*/


/*
func main() {


fmt.Println("test")

*/


/*
fin := make(chan bool)

go func() {
  log.Println("worrk")
  fin <- false
}()

log.Println(fin)

<- fin

log.Println(fin)
log.Println(fin)
*/


/*
// チャネル
myChan := make(chan int) // intを送受信どちらもできるchannel
go listenChannel(myChan) // 並行処理goroutineを立ち上げる
myChan <- 100 // 100を流し込む
myChan <- 200
*/


/*
r := gin.Default()

r.GET("/", func(c *gin.Context) {
    c.String(200, "Hello world")
})

r.GET("/hoge", func(c *gin.Context) {
    c.String(200, "fuga")
})

r.Run(":8080")
*/



/*
http.HandleFunc("/a", handler)

http.HandleFunc("/b", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Hello from Closure")
})

http.ListenAndServe(":8080", nil)
*/





/*
a := [5]int{2, 10, 8, 15, 4}

b := a[2:4] // [8, 15]
c := a[2:]  // [8, 15, 4]
d := a[:4]  // [2, 10, 8, 15]
e := a[:]   // [2, 10, 8, 15, 4]
fmt.Println(b)
fmt.Println(c)
fmt.Println(d)
fmt.Println(e)

// スライスの長さを取得
fmt.Println(len(c)) // 3

// make関数でいきなりスライスを作成する
s1 := make([]int, 3) // [0 0 0]

// いきなり値を割り当てたスライスを作成する
s2 := []int{1, 3, 5} // 配列の宣言と似ている
fmt.Println(s1)
fmt.Println(s2)

// appendでスライスの末尾に要素を追加
s3 := append(s2, 8, 2, 10)
fmt.Println(s3)

// copyでスライスをコピー
// 返り値は要素数
t := make([]int, len(s3))
s4 := copy(t, s3)
fmt.Println(s4)


// 値を指定しながら宣言する
m := map[string]int{"fujimoto": 100, "arita": 200} // map[fujimoto:100 arita:200]

// キーの存在を調べる
v, ok := m["fujimoto"]

fmt.Println(v)  // 100
fmt.Println(ok) // true

// 要素を削除する
delete(m, "fujimoto")
fmt.Println(m) // map[arita:200]




go task1()
go task2()

// goroutineが終わる前に main 関数自体が終わる為、待ち時間をつける。
time.Sleep(time.Second * 3)
*/






/*
var a int
var b float64
var c string
var d bool
fmt.Printf("a: %d, b:%f, c:%s, d:%t\n", a, b, c, d)
*/


/*
文字出力
fmt.Printf("Hell, World\n")
*/

/*
// 文字列操作
fmt.Printf(strings.ToLower("aabbccdd\n"));
fmt.Printf(strings.ToUpper("aabbccdd\n"));
*/


/*
*/
// 文字列検索


/*
*/
// 数値、数字 計算


/*
*/
// 配列


/*
*/
// 連想配列


/*
*/
// 配列の検索


/*
*/
// 条件分岐


/*
*/
// case分岐


/*
*/
// 繰り返し


/*
*/
// 無限繰り返し


/*
*/
// foreach


/*
*/
// クラス


/*
*/
// 無名関数


/*
*/
// ラムダ


/*
*/
// クロージャ


/*
*/
// jsonの取扱


/*
*/
// restの取扱




/*
// hell world
fmt.Printf("Hello, World\n")
*/

// } /* ------------------------------------------- */


/*
func task1() {
    // 重い処理を想定
    time.Sleep(time.Second * 2)
    fmt.Println("task1 finished!")

}

func task2() {
    fmt.Println("task2 finished!")
}
*/


/*
// 型(構造体)の定義
type Something struct {
  member int
}
*/

/*
// メソッドの定義
func ( this *Something ) Function() {
  fmt.Printf( "%d", this.member );
}
*/


/*
func init() {
  fmt.Printf("init\n");
}
*/


/*
func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "Hello World from Go.")
}
*/



/*
func listenChannel(myCh chan int) {
    // myChからの送信を受け取る
    for out := range myCh {
        fmt.Println(
            fmt.Sprintf("out from channel => %d",out),
        )
    }
}
*/


func main() {tmp()}
