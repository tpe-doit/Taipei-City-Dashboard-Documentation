## 概述

在深入研究這個專案的程式庫之前，建議先對使用者介面有全面的了解。

如果用戶未登入，只有儀表板頁面和地圖頁面可以使用，展示公共儀表板和組件。

![未登入的用戶界面儀表板頁面](/images/front-end/user-interface-1.png)

> **i01**
> 在前端框架中也有組件(Component)的概念，將應用程式拆成數個較小的模組，以更輕易構建使用者介面。而在這個專案中，我們亦認為「組件」最適合用來描述構成儀表板的基本元素。
>
> 因此為了消除混淆，從現在開始，前端框架的組件將被稱為「Vue 元件」，而儀表板的組件將直接稱為「組件」。

如果用戶已登入，除了儀表板頁面和地圖頁面外，用戶還可以檢視自己的儀表板。組件頁面和組件資訊頁面也將對用戶開放。如果用戶是管理員，他們也可以透過點擊導航列上的用戶名來進入管理員頁面。

![已登入的用戶界面儀表板頁面](/images/front-end/user-interface-2.png)

## /dashboard

儀表板頁面以圖表形式顯示組件的統計資料。在這裡，用戶可以全面了解組件所提供的所有統計資料。

在儀表板頁面中，大多數組件的右下角還提供了「組件資訊 **_arrow_circle_right_** 」 選項。點擊此按鈕後一個視窗會彈出，顯示該組件的詳細資訊，含（如有）歷史資料。該彈跳視窗亦會提供「**_flag_** 回報問題 」和「**_download_** 下載資料」的選項。

## /mapview

地圖頁面在左側列出所有組件，並在右側顯示較大的地圖。透過點擊開關，組件會展開並將空間資料（如有）渲染到地圖上。如要了解地圖上各資料點的更多資訊，點擊即會彈出資訊匡。

![用戶界面地圖頁面](/images/front-end/user-interface-3.png)

## /component

組件頁面以表格形式列出所有可用的組件。在頁面的左側，有一個設定欄可以為現有的儀表板添加組件或建立新的儀表板。點擊每個組件的右上角的 **_add_circle_** 圖示即可將其添加至設定欄。點擊「資訊頁面 **_arrow_circle_right_**」將打開組件資訊頁面。

![用戶界面組件頁面](/images/front-end/user-interface-4.png)

## /component/:index

在組件資訊頁面，用戶可以查看組件提供的所有統計數據與歷史數據，亦能「**_flag_** 回報問題 」和「**_download_** 下載資料」。

![用戶界面組件資訊頁面](/images/front-end/user-interface-5.png)

## /admin

管理員頁面只對具有管理員權限的用戶開放。在這裡，管理員可以建立，編輯和刪除公共儀表板和組件。管理員還可以查看所有用戶及其權限。

![用戶界面管理員頁面](/images/front-end/user-interface-6.png)

## 行動版本

儀表板是為平板或電腦設計的。因此，儀表板的行動版本僅支援預覽組件的圖表和歷史數據。用戶也無法在手機上登入儀表板。

![用戶界面行動版本](/images/front-end/user-interface-7.png)
