## 概述
在深入研究這個專案的程式庫之前，建議先對使用者介面有全面的了解。

本專案中有兩個主要的使用者介面：儀表板頁面（/dashboard）和地圖頁面（/mapview）。這兩個使用者介面均有針對不同的螢幕大小進行了優化，包括行動裝置。在這兩個使用者介面中，均包含導航列 (1: NavBar)、側邊欄 (2: SideBar) 和設定列 (3: SettingsBar)。

![使用者介面 儀表板頁面](/images/front-end/user-interface-1.png)

> **i01**
> 在前端框架中也有組件(Component)的概念，將應用程式拆成數個較小的模組，以更輕易構建使用者介面。而在這個專案中，我們亦認為「組件」最適合用來描述構成儀表板的基本元素。
>
> 因此為了消除混淆，從現在開始，前端框架的組件將被稱為「Vue 元件」，而儀表板的組件將直接稱為「組件」。

## /dashboard
儀表板頁面以圖表形式顯示組件的統計資料。在這裡，用戶可以全面了解組件所提供的所有統計資料。

在儀表板頁面中，大多數組件的右下角還提供了「更多資訊 ***arrow_circle_right*** 」(4) 選項。點擊此按鈕後一個視窗會彈出，顯示該組件的詳細資訊，含（如有）歷史資料（5）。該彈跳視窗亦會提供「***flag***回報問題 」（6）和「***download***下載資料」（7）的選項。

![使用者介面 組件](/images/front-end/user-interface-2.png)

## /mapview
地圖頁面在左側列出所有組件 (8)，並在右側顯示較大的地圖 (9)。透過點擊開關 (10)，組件會展開並將空間資料（如有）渲染到地圖上。如要了解地圖上各資料點的更多資訊，點擊即會彈出資訊匡 (11)。

![使用者介面 地圖頁面](/images/front-end/user-interface-3.png)

## 行動版
行動版中有一些功能因空間或記憶體限制而不支援。

如要在儀表板頁面和地圖頁面之間切換，請點擊設定列右側的開關 (12)。如要在不同的儀表板之間切換，請點擊儀表板名稱左側的圖示 (13: ***arrow_drop_down_circle***)，這將使一個選單彈出。在行動版中，無法查看組件的「更多資訊」。

在地圖頁面中，點擊圖層圖示 (14: ***layers***) 會彈出一個選單，可以選擇欲渲染的圖層。在行動版中，無法同時查看圖表和地圖圖層。

![使用者介面 行動版](/images/front-end/user-interface-4.png)