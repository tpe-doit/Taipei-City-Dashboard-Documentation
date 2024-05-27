---
title: 運行第一個DAG

---

## 執行第一個DAG

當你根據[下載並設定專案](/data-end/project-setup)章節部屬成功後，可在瀏覽器上輸入 `localhost://Ariflowflow` 進入 Airflow 網頁介面。

在畫面中點開按鈕，

![image](https://hackmd.io/_uploads/Hyw2L9rf0.png)

該 DAG 會自動執行一次。

![image](https://hackmd.io/_uploads/r183Sjo-0.png)

若 DAG 為自動執行，請先重新整理頁面。若還是沒執行，可手動執行如下圖：

![image](https://hackmd.io/_uploads/HJlA89rMA.png)

待執行完畢應可以查看這個畫面。

![image](https://hackmd.io/_uploads/B1MlLosWC.png)

恭喜，這代表你成功運行了一隻 DAG!


## 檢查第一筆資料

透過瀏覽器輸入 `localhost://pgadmin` 可以進入 pgAdmin，pgAdmin 是 PSQL 的圖形化介面，讓我們更容易操作 PSQL。

你可以在 pgAdmin 的左側欄找到所有 server，打開選單可查看每個 server 下的資料庫，再打開資料庫下的 Schemas 的 Tables 就能查看所有表了。

![image](https://hackmd.io/_uploads/HJznP9rzR.png)

找到 `db:dashboard/dashboard/heal_hospital`，利用滑鼠右鍵選擇 `View/Edit Data` 並選擇 `Last 100 Rows` 如下圖：

![image](https://hackmd.io/_uploads/HJXM_cSz0.png)

將卷軸拉到最右邊，你應該可以查看除了資料以外，欄位 `_mtime` 與 DAG 執行時間非常相近。。

![image](https://hackmd.io/_uploads/Hye4dcSGC.png)

恭喜，這代表你的 DAG 不只執行成功，資料也成功入庫了!

> **i01**
> `_mtime`是該列資料的最後修改時間，標準表的欄位說明可見上一章[建立資料表](/data-end/dag-table)。
