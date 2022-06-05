<script lang="ts">
  import { onMount } from "svelte";

  let data = {
    Fish: {
      trout: {},
      salmon: {},
    },

    Tree: {
      Huge: {
        sequoia: {},
        oak: {},
      },
      Flowering: {
        redbud: {},
        magnolia: {
          xxx: {
            yyy: {},
          },
          zzz: {},
        },
      },
    },
  };

  function createTree(container: HTMLElement, obj: {}) {
    container.innerHTML = createTreeText(obj);
  }

  function createTreeText(obj: {}) {
    let li = "";
    for (let key in obj) {
      li +=
        "<li class='ml-[30px]'>・" + key + createTreeText(obj[key]) + "</li>";
    }
    let ul: string;
    if (li) {
      ul = "<ul>" + li + "</ul>";
    }
    return ul || "";
  }
  onMount(() => {
    const container = document.getElementById("container");
    createTree(container, data);
  });
</script>

<div id="container" />

<style lang="postcss">
</style>
