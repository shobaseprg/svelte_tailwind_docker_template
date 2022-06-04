<script lang="ts">
  import Button from "../module/Button.svelte";

  type MenuObj = {
    title: string;
    path: string;
  };

  type MenuList = MenuObj[];
  export let menuList: MenuList;

  let selectItemsPath = [];

  function isSelect(path: string): boolean {
    return selectItemsPath.some((p) => {
      p == path;
    });
  }
</script>

<div class="w-[300px] h-[100%] border-2 p-2">
  {#each menuList as menu, i}<Button
      title={menu.title}
      width={"full"}
      targetPath={menu.path}
      selected={isSelect(menu.path)}
      on:click={() => {
        selectItemsPath = [...selectItemsPath, menu.path];
      }}
    />
  {/each}
</div>

<style lang="postcss">
</style>
