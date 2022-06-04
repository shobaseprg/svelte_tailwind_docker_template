import RouterTest from "./component/RouterTest.svelte"
import Home from "./component/Home.svelte"
import JsHome from "./component/Js/JsHome.svelte"
import CreateTree from "./component/Js/CreateTree.svelte";
import CreateList from "./component/Js/CreateList.svelte";

import Router, { push } from "svelte-spa-router";

let routes = {
  "/": Home,
  '/javascript': JsHome,
  '/javascript/*': JsHome,
}

let jsRoutes = {
  "/createTree": CreateTree,
  "/createList": CreateList
}

function movePage({ path }: { path: string }) {
  push(path);
}
export { routes, movePage, jsRoutes };
