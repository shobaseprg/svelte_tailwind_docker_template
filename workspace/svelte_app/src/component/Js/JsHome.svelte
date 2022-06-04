<script lang="ts">
  import Router from "svelte-spa-router";
  import { jsRoutes } from "../../router";

  import SideMenu from "../layout/SideMenu.svelte";
  let menuList = [
    {
      title: "オブジェクトからツリーを作成する",
      path: "/javascript/createTree",
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
