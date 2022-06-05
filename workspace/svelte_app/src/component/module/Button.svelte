<script lang="ts">
  import { createEventDispatcher, beforeUpdate } from "svelte";
  import { movePage } from "../../router";

  export let title: string;
  export let width: string | "full" = "100";
  export let textPos: "l" | "c" | "r" = "l";
  /** ページ遷移させる場合に遷移先のURLを渡す*/
  export let targetPath: string | null = null;
  export let selected: boolean = false;

  let adjustWidth: string;
  let color: string;
  let textPosition: string;

  beforeUpdate(() => {
    adjustWidth = width == "full" ? "w-full" : `w-[${width}]`;
    color = selected ? "bg-red-300" : "bg-green-200";

    switch (textPos) {
      case "l":
        textPosition = "text-left";
        break;
      case "c":
        textPosition = "text-center";
        break;

      case "r":
        textPosition = "text-right";
        break;
      default:
        break;
    }
  });

  const dispatch = createEventDispatcher();

  function onclickHundle() {
    targetPath ? movePage({ path: targetPath }) : dispatch("buttonClick");
  }
</script>

<button
  class={`${color} p-1  ${textPosition}  ${adjustWidth}`}
  on:click={onclickHundle}>{title}</button
>

<style lang="postcss">
</style>
