<script lang="ts">
  import Router, { push } from "svelte-spa-router";
  import routes from "./router";
</script>

<main>
	<button class="bg-red-300 w-[500px]" on:click={ () => { push("/router_test") } }>button</button>
  <Router {routes} />
</main>



<style global lang="postcss">
  @tailwind base;
  @tailwind components;
  @tailwind utilities;
</style>
