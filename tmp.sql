/*
*/






/*
-- テンポラリ
create temp table tmp (one int, two int);

insert into tmp(one, two) values(1,2);
insert into tmp(one, two) values(10,20);

select * from tmp;
*/


--変数のグループ名(変数名1, 変数名2, ...) AS (
--  SELECT 変数名1の値, 変数名2の値 ...
--)

/*
\set start 3
\set end 10
\echo :start - :end
*/

/*
-- 単純CASE式 NG
\set ccc 'a'
CASE :ccc
WHEN 'a' THEN 0
WHEN 'b' THEN 10
         ELSE -1
END;
*/


/*
--検索CASE式 NG
CASE
WHEN col = 'a'
  THEN 0
WHEN col IN('b', 'c')
  THEN 10
  ELSE -1
END;
*/



/*
-- 配列
WITH 
  arr(i, val) AS (
    SELECT 0, 100
    UNION ALL
    SELECT 1, 200
    UNION ALL
    SELECT 2, 300
  )
SELECT i, val FROM arr
UNION ALL
-- 要素の個数
SELECT COUNT(*), NULL FROM arr
*/

/*
-- 分割 ダメだった
WITH RECURSIVE
  Input(s, delim) AS (
    SELECT 'aaa,bbb,ccc', ','
  )
, SplitCore(i, res, delim, s) AS (
    SELECT 0, CAST(NULL AS text), delim, s FROM Input
    UNION ALL
    SELECT
        i + 1
      , CAST(COALESCE(lpad(s, NULLIF(strpos(s, delim), 0) - 1), s) AS text)
      , delim
      , SUBSTRING(s, NULLIF(strpos(s, delim), 0) + 1, length(s))
    FROM
        SplitCore
    WHERE
        s IS NOT NULL
  )
, Split(i, res) AS (
    SELECT i, res FROM SplitCore WHERE res IS NOT NULL
  )
SELECT res FROM  Split ORDER BY i;
*/


/*
-- 数値
select 10, 0.5;
SELECT 5.0 / 2;

-- 文字列
SELECT 'あ';
SELECT N'あ'; -- unicode

-- 結合
-- SELECT 'aaa' + 'bbb' -- psqlではNG
SELECT 'aaa' || 'bbb'; -- psql

-- 長さ
SELECT length('abcdef'); -- 6

-- 切り出し
SELECT SUBSTRING('abcd', 1, 3); -- abc

-- 検索
SELECT strpos('abcd', 'bc'); -- 2
*/


/*
-- 1から10までの数字を表示するSQLその2
WITH RECURSIVE
  Input(f, t) AS ( SELECT 1, 10)
, Seq(n) AS (
    SELECT f FROM
    Input
      UNION ALL SELECT n + 1
      FROM Seq
      INNER JOIN Input ON Seq.n + 1 <= Input.t
  )
SELECT n
FROM Seq
ORDER BY n;
*/

/*
-- 1から100までの数を合計する
WITH RECURSIVE tmp(n) AS
(
  VALUES (1)
  UNION ALL
    SELECT n+1 FROM tmp WHERE n < 100
)
SELECT sum(n) FROM tmp;
*/


/*
-- 1から10までの数字を表示するSQL
WITH RECURSIVE
  -- 入力は1から10まで
  Input(f, tmp) AS (SELECT 1, 10), Seq(n) AS
  (
    -- 最初はInputのf
    SELECT f FROM Input
    UNION ALL
    -- それ以降は1ずつ数値をインクリメント
    SELECT n + 1
    FROM Seq
    WHERE n + 1 <= (SELECT tmp FROM Input) -- n + 1がInputのtより小さい間出力
  )
-- 出力
SELECT n
FROM Seq
ORDER BY n;
*/

/*
select 234 as jjj
*/
