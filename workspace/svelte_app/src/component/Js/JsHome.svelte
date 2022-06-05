<script lang="ts">
  import Router from "svelte-spa-router";
  import { jsRoutes } from "../../router";

  import SideMenu from "../layout/SideMenu.svelte";
  let menuList = [
    {
      title: "オブジェクトから再起的にリストを作る１",
      path: "/javascript/createTree",
    },
    {
      title: "オブジェクトから再起的にリストを作る2",
      path: "/javascript/createTree2",
    },
    {
      title: "リストを作成する",
      path: "/javascript/createList",
    },
  ];

  const prefix = "/javascript";
</script>

<div class="flex h-full">
  <SideMenu {menuList} />
  <Router routes={jsRoutes} {prefix} />
</div>

<style lang="postcss">
</style>
