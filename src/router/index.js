import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import DocPage from "../views/DocPage.vue";

const routes = [
  {
    path: "/",
    component: Home,
    name: "home",
  },
  {
    path: "/front-end",
    redirect: "/front-end/introduction",
  },
  {
    path: "/front-end/:id",
    component: DocPage,
    name: "front-end",
    props: true,
  },
  {
    path: "/:pathMatch(.*)*",
    redirect: "/",
  },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  base: import.meta.env.BASE_URL,
  routes,
});

export default router;
