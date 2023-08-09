## 概觀
這個專案的所有新開發都需要源自於一個issue。如要開立一個issue，請前往 [GitHub](https://github.com/tpe-doit/Taipei-City-Dashboard-FE/issues/new/choose) 的issues頁面，然後選擇其中一種issue類型。您必須完整填寫issue模板，您的issue才會被考慮與審查。沒有提供明確指引或描述的issue可能會立即被關閉。

我們建議在開始開發之前先等待issue被批准。這是因為所有pull request需要解決至少一個已批准的issue才能被考慮與審查。下面解釋了每種issue類型的批准標準。

>**w01**
>如果您的issue得到批准，並且您希望自己開發，請記得 fork repository並在自己的repository上進行更改。不要 clone repository，因為非合作者無法直接推送(push)到官方repository。

## 錯誤回報 (Bug Report)
如果這個專案中的任何功能不如您期望的運作，您應該開啟一個錯誤回報issue。

只要模板被完整填寫並確認存在該錯誤，issue將被批准進行處理。

## 新功能請求 (Feature Request)
如果您想要添加新功能、圖表類型、地圖類型等，您應該開啟一個新功能issue。

只有在專案中沒有現有解決方案，並且它將為本專案增加顯著價值時，才會批准添加新功能。

>**w02**
>可以透過調整 `chart_config` 或 `map_config` 達到的任何效果將不會被批准為新功能。

## 新組件 (New Component)
如果您想要在儀表板中添加新組件，您應該開啟一個新組件issue。如果您只是對現有組件有建議（而不是錯誤），請透過電子郵件與我們聯繫。

在新組件請求的模板中，您將被要求填寫一個或多個 [data.taipei](https://data.taipei) 的資料來源。然而，對於資料集的整潔度、格式或獲取方式（檔案或 API）我們並不設限。如果新組件請求被批准，您只需根據資料來源創建一個靜態組件，完成後我們將負責資料清理和介接。

一個新組件要被考慮必須符合以下標準：***looks_one*** 不提供與其他組件相同的數據、***looks_two*** 不過於複雜或簡單、***looks_3*** 能協助改善台北市政策制定、***looks_4*** 與台北市居民或訪客的日常生活相關。

>**w03**
>如果您的新組件需要一個新的圖表或地圖效果，且無法透過調整 `chart_config` 或 `map_config` 實現，請同時開啟一個新功能請求。
