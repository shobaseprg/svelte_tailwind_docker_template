<script lang="ts">
  import { onMount } from "svelte";

  onMount(() => {
    let lis = document.querySelectorAll("li");
    for (let li of lis) {
      li.classList.add("ml-[30px]");
      let descendantsCount = li.getElementsByTagName("li").length;
      if (!descendantsCount) continue;
      li.firstChild.nodeValue += " [" + descendantsCount + "]";
    }
  });
</script>

<ul>
  <li>
    Animals
    <ul>
      <li>
        Mammals
        <ul>
          <li>Cows</li>
          <li>Donkeys</li>
          <li>Dogs</li>
          <li>Tigers</li>
        </ul>
      </li>
      <li>
        Other
        <ul>
          <li>Snakes</li>
          <li>Birds</li>
          <li>Lizards</li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    Fishes
    <ul>
      <li>
        Aquarium
        <ul>
          <li>Guppy</li>
          <li>Angelfish</li>
        </ul>
      </li>
      <li>
        Sea
        <ul>
          <li>Sea trout</li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<style lang="postcss">
</style>
