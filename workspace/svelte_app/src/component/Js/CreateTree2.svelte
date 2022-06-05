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
          xxx2: {
            yyy2: {},
          },
          zzz2: {},
        },
      },
    },
  };

  onMount(() => {
    let container = document.getElementById("container");

    function createTree(container, obj) {
      container.append(createTreeDom(obj));
    }

    function createTreeDom(obj) {
      if (!Object.keys(obj).length) return;

      let ul = document.createElement("ul");

      for (let key in obj) {
        let li = document.createElement("li");
        li.classList.add("ml-[30px]");
        li.innerHTML = "・" + key;

        let childrenUl = createTreeDom(obj[key]);
        if (childrenUl) {
          li.append(childrenUl);
        }

        ul.append(li);
      }

      return ul;
    }

    createTree(container, data);
  });
</script>

<div id="container" />

<style lang="postcss">
</style>
