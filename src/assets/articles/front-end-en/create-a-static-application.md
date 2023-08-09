## Introduction
This project is perfect for displaying statistical and geographical data in conjunction. If the data you are displaying is static, transforming this project into a completely static application may be a good choice.

>**i01**
>If you are looking to create a dynamic application, please skip this article and move on to the [next](/front-end/create-a-dynamic-application).

## Remove Irrelevant Elements
Currently, this project includes many functionalities that typically only are present in dynamic applications. This is so that a backend could be easily implemented when available. These functionalities could be easily removed to create a completely static application.

Locate the file specified in each step and follow the instructions to remove all irrelevant UI elements.

### Step 1 SideBar.vue
Comment out the favorites dashboard tab and the add dashboard button.

```html
&lt;template&gt;
    &lt;div ...&gt;
        &lt;!-- 1-1 Favorites dashboard tab --&gt;
        &lt;!-- &lt;h2&gt;{{ isExpanded ? `我的最愛` : `最愛` }}&lt;/h2&gt;
        &lt;SideBarTab icon=&quot;favorite&quot; title=&quot;收藏組件&quot; :expanded=&quot;isExpanded&quot; index=&quot;favorites&quot; /&gt; --&gt;
        &lt;div class=&quot;sidebar-sub-add&quot;&gt;
            &lt;h2&gt;{{ isExpanded ? `儀表板列表` : `列表` }}&lt;/h2&gt;
            &lt;!-- 1-2 Add dashboard button --&gt;
            &lt;!-- &lt;button v-if=&quot;isExpanded&quot; @click=&quot;dialogStore.showDialog('addDashboard')&quot;&gt;新增&lt;/button&gt;
            &lt;AddDashboard /&gt; --&gt;
        &lt;/div&gt;
        ...
    &lt;/div&gt;
&lt;/template&gt;
```

### Step 2 MobileNavigation.vue
Comment out the favorites dashboard tab.
```html
&lt;template&gt;
    ...
        &lt;div class=&quot;mobilenavigation&quot;&gt;
            &lt;!-- 2 Favorites dashboard tab --&gt;
            &lt;!-- &lt;h2&gt;我的最愛&lt;/h2&gt;
            &lt;SideBarTab icon=&quot;favorite&quot; title=&quot;收藏組件&quot; :expanded=&quot;true&quot; index=&quot;favorites&quot;
                @click=&quot;dialogStore.hideAllDialogs&quot; /&gt; --&gt;
            ...
        &lt;/div&gt;
    ...
&lt;/template&gt;
```

### Step 3 SettingsBar.vue
Comment out the add components and dashboard settings button.

```html
&lt;template&gt;
    &lt;div class=&quot;settingsbar&quot;&gt;
        ...
            &lt;!-- 3 Add components and dashboard settings --&gt;
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

### Step 4 NavBar.vue
Comment out the user settings button.

```html
&lt;template&gt;
    ...
        &lt;div class=&quot;navbar-user&quot;&gt;
            ...
            &lt;!-- 4 User settings --&gt;
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

### Step 5 ComponentContainer.vue
Comment out the favorite, flag, and delete buttons.

```html
&lt;template&gt;
    ...
        &lt;!-- 5 favorite, flag, delete --&gt;
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

### Step 6 MoreInfo.vue
Comment out the flag button.

```html
&lt;template&gt;
    &lt;DialogContainer ...&gt;
        ...
            &lt;!-- 6 flag button --&gt;
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

### Step 7 MapContainer.vue
Remove the delete and add saved location button.

```html
&lt;template&gt;
    &lt;div class=&quot;mapcontainer&quot;&gt;
        ...
        &lt;div class=&quot;mapcontainer-controls hide-if-mobile&quot;&gt;
            ...
                &lt;!-- 7-1 delete saved location --&gt;
                &lt;!-- &lt;div class=&quot;mapcontainer-controls-delete&quot;&gt;
                    &lt;span&gt;delete&lt;/span&gt;
                &lt;/div&gt; --&gt;
            ...
            &lt;!-- 7-2 add saved location --&gt;
            &lt;!-- &lt;input ... @keypress.enter=&quot;handleSubmitNewLocation&quot; /&gt; --&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/template&gt;
```

### Step 8 ContentStore.js
Comment out the following section that singles out the favorites dashboard.

```js
setDashboards() {
    axios
        .get("/dashboards/all_dashboards.json")
        .then((rs) => {
          ...
          //   8 code that singles our favorites dashboard
          //   const favorites = this.dashboards.find(
          //     (item) => item.index === "favorites"
          //   );
          //   this.favorites = [...favorites.components];
          ...
        })
        ...
},
```

### Step 9 allDashboards.json
Remove the favorites dashboard.

```json
{
  "data": [
    ...
    // 9 remove favorites dashboard
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

Now, the user interface should be completely clear of dynamic elements. All code and components that are unused can be deleted.
