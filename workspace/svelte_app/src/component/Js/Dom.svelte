<script lang="ts">
  import { onMount } from "svelte";

  console.log("【ログ: navigator】", navigator);
  console.log("【ログ: location】", location);

  onMount(() => {
    console.groupCollapsed("【(g)ログ: 】");
    const parent = document.getElementById("parent");
    console.log("【ログ: parent】", parent);
    console.log("【ログ: parent.childNodes】", parent.childNodes);
    console.log("【ログ: parent.children】", parent.children);
    console.log("【ログ: parent.firstChild】", parent.firstChild);
    for (const childNode of parent.childNodes) {
      console.log("【ログ: childNode】", childNode);
      console.log("【ログ: childNode.NodeType】", childNode.nodeType);
    }
    console.log(
      "【ログ: parent.firstChild.parentNode】",
      parent.firstChild.parentNode
    );
    console.log("【ログ: parent.innerHTML】", parent.innerHTML);

    parent.lastElementChild.innerHTML = "<p>changed last child</p>";
    parent.lastElementChild.innerHTML += "<p>add child </p>";

    console.log(
      "【ログ: parent.lastElementChild.outerHTML】",
      parent.lastElementChild.outerHTML
    );
    console.log("【ログ: typeof(parent.childNodes[1])】", parent.childNodes[1]);

    let name = prompt("What's your name?", "<b>Winnie-the-pooh!</b>");

    const elem1 = document.getElementById("elem1");
    const elem2 = document.getElementById("elem2");

    elem1.innerHTML = name;
    elem2.textContent = name;
    console.groupEnd();
  });
</script>

<div id="parent">
  <p>child1</p>
  <p>child2</p>
  <p>child3</p>
  <div id="elem1" />
  <div id="elem2" />
</div>

<style lang="postcss">
</style>
