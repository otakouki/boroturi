<?php

define('HOST','boroturi-db-1');
define('USR','ecc');
define('PASS','ecc');
define('DB','boroturi');

if (!$con = mysqli_connect(HOST, USR, PASS, DB)) {
        //データベースに接続できないときのメッセージ
        die('データベースに接続できません');
}
?>