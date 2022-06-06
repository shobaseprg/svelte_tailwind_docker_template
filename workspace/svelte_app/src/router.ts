import RouterTest from "./component/RouterTest.svelte"
import Home from "./component/Home.svelte"
import JsHome from "./component/Js/JsHome.svelte"
import CreateTree from "./component/Js/CreateTree.svelte";
import CreateTree2 from "./component/Js/CreateTree2.svelte";
import CreateList from "./component/Js/CreateList.svelte";
import CountDescendants from "./component/Js/CountDescendants.svelte";
import Calendar from "./component/Js/Calendar.svelte"
import Dom from "./component/Js/Dom.svelte";
import SecectionRange from "./component/Js/SelectionRange.svelte"

import Router, { push } from "svelte-spa-router";
import SelectionRange from "./component/Js/SelectionRange.svelte";

let routes = {
  "/": Home,
  '/javascript': JsHome,
  '/javascript/*': JsHome,
}

let jsRoutes = {
  "/createTree": CreateTree,
  "/createTree2": CreateTree2,
  "/createList": CreateList,
  "/countDescendants": CountDescendants,
  "/calendar": Calendar,
  "/dom": Dom,
  "/selectionRange": SelectionRange
}

function movePage({ path }: { path: string }) {
  push(path);
}
export { routes, movePage, jsRoutes };
