## 簡介
這個專案能夠滿足同時呈現統計和空間資料的需求。如果您要顯示的數據是靜態的，將這個專案轉換成一個完全靜態的網頁是一個不錯的選擇。

>**i01**
>如果您希望建立一個動態網頁，請先跳過本文章並繼續閱讀[下一篇](/front-end/create-a-dynamic-application)。

## 刪除不相關的元素
目前，這個專案包含了許多通常只存在於動態網頁中的功能。這是為了在有需要時可以輕鬆串接後端。這些功能可以輕易被刪除以建立一個完全靜態的網頁。

找到每個步驟中指定的檔案，按照說明刪除所有不相關的UI元素。

### 步驟 1 SideBar.vue
註釋掉收藏儀表板按鈕和收藏儀表板按鈕。

```html
&lt;template&gt;
    &lt;div ...&gt;
        &lt;!-- 1-1 收藏儀表板按鈕 --&gt;
        &lt;!-- &lt;h2&gt;{{ isExpanded ? `我的最愛` : `最愛` }}&lt;/h2&gt;
        &lt;SideBarTab icon=&quot;favorite&quot; title=&quot;收藏組件&quot; :expanded=&quot;isExpanded&quot; index=&quot;favorites&quot; /&gt; --&gt;
        &lt;div class=&quot;sidebar-sub-add&quot;&gt;
            &lt;h2&gt;{{ isExpanded ? `儀表板列表` : `列表` }}&lt;/h2&gt;
            &lt;!-- 1-2 收藏儀表板按鈕 --&gt;
            &lt;!-- &lt;button v-if=&quot;isExpanded&quot; @click=&quot;dialogStore.showDialog('addDashboard')&quot;&gt;新增&lt;/button&gt;
            &lt;AddDashboard /&gt; --&gt;
        &lt;/div&gt;
        ...
    &lt;/div&gt;
&lt;/template&gt;
```

### 步驟 2 MobileNavigation.vue
註釋掉收藏儀表板按鈕。
```html
&lt;template&gt;
    ...
        &lt;div class=&quot;mobilenavigation&quot;&gt;
            &lt;!-- 2 收藏儀表板按鈕 --&gt;
            &lt;!-- &lt;h2&gt;我的最愛&lt;/h2&gt;
            &lt;SideBarTab icon=&quot;favorite&quot; title=&quot;收藏組件&quot; :expanded=&quot;true&quot; index=&quot;favorites&quot;
                @click=&quot;dialogStore.hideAllDialogs&quot; /&gt; --&gt;
            ...
        &lt;/div&gt;
    ...
&lt;/template&gt;
```

### 步驟 3 SettingsBar.vue
註釋掉新增組件與儀表板設定按鈕。

```html
&lt;template&gt;
    &lt;div class=&quot;settingsbar&quot;&gt;
        ...
            &lt;!-- 3 新增組件與儀表板設定按鈕 --&gt;
            &lt;!-- &lt;div class=&quot;settingsbar-settings&quot;&gt;
                &lt;button @click=&quot;dialogStore.showDialog('addComponent')&quot;&gt;&lt;span&gt;add_chart&lt;/span&gt;
                    &lt;p&gt;新增組件&lt;/p&gt;
                &lt;/button&gt;
                &lt;AddComponent /&gt;
                &lt;button @click=&quot;dialogStore.showDialog('dashboardSettings')&quot;&gt;&lt;span&gt;settings&lt;/span&gt;
                    &lt;p&gt;設定&lt;/p&gt;
                &lt;/button&gt;
                &lt;DashboardSettings /&gt;
            &lt;/div&gt; --&gt;
        ...
&lt;/template&gt;
```

### 步驟 4 NavBar.vue
註釋掉用戶設定按鈕。

```html
&lt;template&gt;
    ...
        &lt;div class=&quot;navbar-user&quot;&gt;
            ...
            &lt;!-- 4 用戶設定按鈕 --&gt;
            &lt;!-- &lt;div class=&quot;navbar-user-user&quot;&gt;
                &lt;button class=&quot;hide-if-mobile&quot;&gt;{{ authStore.user.name }}&lt;/button&gt;
                &lt;button class=&quot;show-if-mobile&quot;&gt;&lt;span&gt;account_circle&lt;/span&gt;&lt;/button&gt;
                &lt;ul&gt;
                    &lt;li class=&quot;hide-if-mobile&quot;&gt;&lt;button @click=&quot;dialogStore.showDialog('userSettings')&quot;&gt;用戶設定&lt;/button&gt;&lt;/li&gt;
                    &lt;li&gt;&lt;button @click=&quot;authStore.handleLogout&quot;&gt;登出&lt;/button&gt;&lt;/li&gt;
                &lt;/ul&gt;
                &lt;teleport to=&quot;body&quot;&gt;
                    &lt;user-settings /&gt;
                &lt;/teleport&gt;
            &lt;/div&gt; --&gt;
        &lt;/div&gt;
    ...
&lt;/template&gt;
```

### 步驟 5 ComponentContainer.vue
註釋掉收藏組件、回報問題、刪除組件按鈕。

```html
&lt;template&gt;
    ...
        &lt;!-- 5 收藏組件、回報問題、刪除組件按鈕 --&gt;
        &lt;!-- &lt;div v-if=&quot;notMoreInfo&quot;&gt;
            &lt;button v-if=&quot;!isMapLayer &amp;&amp; contentStore.currentDashboard.index !== 'favorites'&quot;
                :class=&quot;{ 'isfavorite': contentStore.favorites.includes(`${content.id}`) }&quot;
                @click=&quot;toggleFavorite&quot;&gt;&lt;span&gt;favorite&lt;/span&gt;&lt;/button&gt;
            &lt;button title=&quot;回報問題&quot;
                @click=&quot;dialogStore.showReportIssue(content.id, content.name)&quot;&gt;&lt;span&gt;flag&lt;/span&gt;&lt;/button&gt;
            &lt;button v-if=&quot;!isMapLayer&quot; @click=&quot;contentStore.deleteComponent(content.id)&quot;&gt;&lt;span&gt;delete&lt;/span&gt;&lt;/button&gt;
        &lt;/div&gt; --&gt;
    ...
&lt;/template&gt;
```

### 步驟 6 MoreInfo.vue
註釋掉回報問題按鈕。

```html
&lt;template&gt;
    &lt;DialogContainer ...&gt;
        ...
            &lt;!-- 6 回報問題按鈕 --&gt;
            &lt;div class=&quot;moreinfo-info-control&quot;&gt;
            &lt;!--&lt;button ...&gt;
                    &lt;span&gt;flag&lt;/span&gt;
                    回報問題
                &lt;/button&gt;--&gt;
				...
            &lt;/div&gt;
        ...
    &lt;/DialogContainer&gt;
&lt;/template&gt;
```

### 步驟 7 MapContainer.vue
註釋掉刪除地點按鈕與新增地點按鈕。

```html
&lt;template&gt;
    &lt;div class=&quot;mapcontainer&quot;&gt;
        ...
        &lt;div class=&quot;mapcontainer-controls hide-if-mobile&quot;&gt;
            ...
                &lt;!-- 7-1 刪除地點按鈕 --&gt;
                &lt;!-- &lt;div class=&quot;mapcontainer-controls-delete&quot;&gt;
                    &lt;span&gt;delete&lt;/span&gt;
                &lt;/div&gt; --&gt;
            ...
            &lt;!-- 7-2 新增地點按鈕 --&gt;
            &lt;!-- &lt;input ... @keypress.enter=&quot;handleSubmitNewLocation&quot; /&gt; --&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/template&gt;
```

### 步驟 8 ContentStore.js
註釋掉把收藏儀表板挑出另外儲存的程式。

```js
setDashboards() {
    axios
        .get("/dashboards/all_dashboards.json")
        .then((rs) => {
          ...
          //   8 收藏儀表板挑出另外儲存的程式
          //   const favorites = this.dashboards.find(
          //     (item) => item.index === "favorites"
          //   );
          //   this.favorites = [...favorites.components];
          ...
        })
        ...
},
```

### 步驟 9 allDashboards.json
移除收藏儀表板。

```json
{
  "data": [
    ...
    // 9 移除收藏儀表板
    // {
    //   "name": "收藏組件",
    //   "index": "favorites",
    //   "components": ["108", "22", "79", "60", "107"],
    //   "icon": "favorite"
    // },
    ...
  ]
}
```

現在，使用者界面已完全沒有動態元素。可以刪除所有不需要的程式和元素。
