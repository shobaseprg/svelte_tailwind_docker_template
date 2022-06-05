<script lang="ts">
  import { subscribe } from "svelte/internal";

  import Button from "../module/Button.svelte";

  type MenuObj = {
    title: string;
    path: string;
  };

  type MenuList = MenuObj[];
  export let menuList: MenuList;

  let selectItemsPath: string[] = [];

  function isSelected(path: string): boolean {
    return selectItemsPath.some((sp) => {
      return sp === path;
    });
  }

  function select(menu: MenuObj) {
    selectItemsPath = [menu.path];
  }
</script>

<div class="w-[300px] h-[100%] border-2 p-2">
  {#each menuList as menu, i}
    <div
      on:click={() => {
        select(menu);
      }}
    >
      {#key selectItemsPath}
        <Button
          title={menu.title}
          width={"full"}
          targetPath={menu.path}
          selected={isSelected(menu.path)}
        />
      {/key}
      <div class="mb-[10px]" />
    </div>
  {/each}
</div>

<style lang="postcss">
</style>
