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
      li.textContent = data;
      ul.append(li);
    }
  });
</script>

<div>
  <p>Create a list</p>
  <div id="list" />
</div>

<style lang="postcss">
</style>
