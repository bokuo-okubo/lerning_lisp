;; 13.2 ゼロからwebサーバを書く

;; - webサーバの仕組み

;; HTTPは、webページをやりとりするために使われるインターネットのプロトコルだ。

;; 確立されたソケットコネクションを通じて、TCP/IPの上で頁をやりとりする層を定義している。
;; クライアントコンピュータ上で走っているプログラム　(通常はwebブラウザ)が定められた形式に沿ったリクエストを送ると、
;; サーバは要求されたページを取り出して、ソケットストリームを通してレスポンスを返す。
;; 例えば、firefoxがクライアントとして、locats.htmlというページを要求したとしよう。
;; リクエスト・メッセージは次のような内容になっているはずだ。

;; ;; ------------------------------------------------------
;; ;; GET /lolcats.html HTTP/1.1
;; ;; Host: localhost:8080
;; ;; User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.5)
;; ;; Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 Accept-Language: en-us,en;q=0.5
;; ;; Accept-Encoding: gzip,deflate
;; ;; Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
;; ;; Keep-Alive: 300
;; ;; Connection: keep-alive
;; ;; ------------------------------------------------------

;; これから作るWebブラウザにとって最も重要なのはリクエスト・メッセージの最初の行だ。
;; そこには、リクエストの種類(GETリクエストは、　頁の内容をそのまま帰すことを要求する)と、要求する頁の名前(locats.html)が含まれている。
;; サーバに送られるこの部分はリクエストヘッダと呼ばれる。
;; リクエストヘッダに続いて、リクエストボディと呼ばれる部分をつかって他の情報をおくることもできる。
;; それについては後で説明する。



;; HTMLドキュメントはhtmlという開きタグと閉じタグによって囲まれている。
;; この中にbody要素があり、その中に書かれたテキストが、webブラウザによってwebページとして表示される。

;; webサーバは通常、レスポンスヘッダと呼ばれる情報も返す。
;; これによってwebブラウザは、受け取ったドキュメントに関する追加情報を知ることができる。例えばドキュメントがHTMLなのか、それとも何かのフォーマットか、といったことだ；。
;; でも今回作るwebサーバは、ヘッダを生成しない。
