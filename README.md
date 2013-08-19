# LinkedList

Ruby で `LinkedList` (連結リスト) を実装しました。

Ruby の `Array` は 配列で実装されているため、先頭への要素を追加や連結するのは効率が悪そうだったので、試しに作ってみました。

## 車輪の再発明じゃないの?

`gem search linked_list` で調べてみたところ、次の2つのgemが見つかりました。

* circular_linked_list (0.0.1)
* linked__list (1.0.0)

しかし、どちらも Ruby で実装されていたので、Cの拡張として実装し直す意味はあるのではないかと思います。

## 使用例

Ocaml の `List` に影響を受けて実装したので、次のようなメソッドがあります。

* cons
* head
* tail
* rev_append
* rev
* append
* length
* nth

また、Ruby独特の文字列や配列への変換メソッドもあります。

* inspect(to_s)
* to_a

以下のような動作をします。

```ruby
require 'linkedlist'

p LinkedList.new # => ()

p l1 = LinkedList.new.cons(1).cons(2).cons(3) # => (3, 2, 1)
p l1.head # => 3
p l1.tail # => (2, 1)

p l2 = LinkedList[1, 2, 3, "a", "b"] #=> (1, 2, 3, "a", "b")

p l1.rev_append(l2) #=> (1, 2, 3, 1, 2, 3, "a", "b")
p l1.rev #=> (1, 2, 3)
p l3 = l1.append(l2) #=> (3, 2, 1, 1, 2, 3, "a", "b")

p l3.length # => 8
p LinkedList[].length #=> 0

p l3.nth(0) #=> 3
p l3[7] #=> "b"
p l3[100] #=> nil
```

## ベンチマーク結果

先頭に長さ3のリストを 連結する処理にかかった秒数を、連結した回数ごとにまとめました。

| Times | Array | LinkedList |
|------:|------:|-----------:|
| 10 | 1.5e-05 | 2.0e-05 |
| 1000 | 0.007251 | 0.00166 |
| 10000 | 0.727542 | 0.015206 |
| 100000 | 102.080825 | 0.414083 |

この測定には、`benchmark.rb`を用いました。

リストの長さが長くなるほど、`Array`よりも`LinkedList` の方が相対的に高速になります。

## インストール方法

```bash
# インストール先のrubyで extconf.rb を実行する
$ ruby extconf.rb
$ make
$ make install
```
