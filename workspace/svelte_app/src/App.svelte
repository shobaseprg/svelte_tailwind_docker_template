<script lang="ts">
  import Router, { push } from "svelte-spa-router";
  import Header from "./component/layout/Header.svelte";
  import { routes } from "./router";
</script>

<Header />
<main class="h-[calc(100%-50px)]">
  <Router {routes} />
</main>

<style global lang="postcss">
  @tailwind base;
  @tailwind components;
  @tailwind utilities;
  body {
    padding: 0px;
  }
</style>
