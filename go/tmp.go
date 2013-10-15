package main
import "fmt"
func main(){
/*
*/


fmt.Printf("Hell, World\n")

/*
// hell world
fmt.Printf("Hello, World\n")
*/

} /* ------------------------------------------- */

/*
*/

// 型(構造体)の定義
type Something struct {
  member int
}
 
// メソッドの定義
func ( this *Something ) Function() {
  fmt.Printf( "%d", this.member );
}