<script lang="ts">
  import { onMount } from "svelte";

  let p: HTMLElement;
  let result;
  let buttons;

  let range = new Range();

  /**選択範囲の削除*/
  function deleteContents() {
    range.deleteContents();
  }

  function extractContents() {
    let content = range.extractContents();
    result.innerHTML = "";
    result.append("extracted: ", content);
  }
  function cloneContents() {
    let content = range.cloneContents();
    result.innerHTML = "";
    result.append("cloned: ", content);
  }
  function insertNode() {
    let newNode = document.createElement("u");
    newNode.innerHTML = "NEW NODE";
    range.insertNode(newNode);
  }
  function surroundContents() {
    let newNode = document.createElement("u");
    try {
      range.surroundContents(newNode);
    } catch (e) {
      alert(e);
    }
  }
  function resetExample() {
    p.innerHTML = `Example: <i>italic</i> and <b>bold</b>`;
    result.innerHTML = "";

    range.setStart(p.firstChild, 2);
    range.setEnd(p.querySelector("b").firstChild, 3);

    window.getSelection().removeAllRanges();
    window.getSelection().addRange(range);
  }

  onMount(() => {
    p = document.getElementById("p");
    result = document.getElementById("result");
    buttons = document.getElementById("buttons");

    resetExample();
  });

  let startOffset: number = 0;
  let endOffset: number = 0;

  let startNode: number = 0;
  let endNode: number = 0;

  function clickNode() {
    try {
      range.setStart(p.childNodes[startNode], startOffset);
      range.setEnd(p.childNodes[endNode], endOffset);
      document.getSelection().removeAllRanges();
      document.getSelection().addRange(range);

      console.log("【ログ: 】", p.childNodes[startNode]);
      console.log("【ログ: 】", p.childNodes[endNode]);
    } catch (e) {
      alert(e);
    }
  }

  function clickOffset() {
    try {
    } catch (error) {
      range.setStart(p.firstChild, startOffset);
      range.setEnd(p.querySelector("b").firstChild, endOffset);
      document.getSelection().removeAllRanges();
      document.getSelection().addRange(range);
    }
  }

  let exst = `<p>Example:
  <i>italic</i> and <b>bold</b>
</p>`;
</script>

<div>
  <p class="mb-[10px]">{exst}</p>
  <div class="flex">
    <p>range :</p>
    <p id="p" class="h-[20px]">
      Example: <i>italic</i> and <b>b<span>ol</span>d</b>
    </p>
  </div>
  <div class="felx">
    <p>result :</p>
    <p id="result" />
  </div>

  <div class="mt-10">
    <div>
      <input id="start" type="number" bind:value={startNode} />
      <input id="end" type="number" bind:value={endNode} />
      <button id="button" on:click={clickNode}>set node</button>
    </div>
    <div>
      <input id="start" type="number" bind:value={startOffset} />
      <input id="end" type="number" bind:value={endOffset} />
      <button id="button" on:click={clickOffset}>set offest</button>
    </div>
    <div class="mt-[30px]" id="buttons">
      <div><button on:click={deleteContents}>deleteContents</button></div>
      <div><button on:click={extractContents}>extractContents</button></div>
      <div><button on:click={cloneContents}>cloneContents</button></div>
      <div><button on:click={insertNode}>insertNode</button></div>
      <div><button on:click={surroundContents}>surroundContents</button></div>
      <div><button on:click={resetExample}>resetExample</button></div>
    </div>
  </div>
</div>

<style lang="postcss">
</style>
