<script lang="ts">
  import { createEventDispatcher } from "svelte";
  import { movePage } from "../../router";

  export let title: string;
  export let width: string | "full" = "100";
  export let margin: string = "0";
  export let targetPath: string | null = null;
  export let selected: boolean = false;

  let adjustWidth = width == "full" ? "w-full" : `w-[${width}]`;

  $: color = selected ? "bg-red-300" : "bg-green-200";

  const dispatch = createEventDispatcher();

  function onclickHundle() {
    targetPath ? movePage({ path: targetPath }) : dispatch("buttonClick");
  }
</script>

<button
  class={`${color} p-1 m-[${margin}px] ${adjustWidth}`}
  on:click={onclickHundle}>{title}</button
>

<style lang="postcss">
</style>
