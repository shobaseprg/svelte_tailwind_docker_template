<script lang="ts">
  import { onMount } from "svelte";

  onMount(() => {
    let ul = document.createElement("ul");
    const div = document.getElementById("list");
    div.append(ul);

    while (true) {
      let data = prompt("Enter the text for the list item", "");

      if (!data) {
        break;
      }

      let li = document.createElement("li");
      li.classList.add("list-disc");
      li.classList.add("ml-[20px]");
      li.textContent = data;
      ul.append(li);
    }
  });
</script>

<div>
  <p class="mb-[10px]">Create a list</p>
  <div id="list" />
</div>

<style lang="postcss">
</style>
