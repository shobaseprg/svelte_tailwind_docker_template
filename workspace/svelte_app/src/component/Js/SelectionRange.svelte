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
    p.innerHTML = `Example: <i>italic</i> and <b>b<span>ol</span>d</b>`;
    result.innerHTML = "";

    range.setStart(p.childNodes[startNodeIndex], startOffset);
    range.setEnd(p.childNodes[endNodeIndex], endOffset);

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

  let startNodeIndex: number = 0;
  let endNodeIndex: number = 0;

  let outerHTML: string = "";

  let startNode;
  let endNode;

  function setSelection() {
    range.setStart(p.childNodes[startNodeIndex], startOffset);
    range.setEnd(p.childNodes[endNodeIndex], endOffset);
    document.getSelection().removeAllRanges();
    document.getSelection().addRange(range);

    outerHTML = p.outerHTML;
    startNode = p.childNodes[startNodeIndex].nodeValue;
    endNode =
      p.childNodes[endNodeIndex].nodeType === 1
        ? p.childNodes[endNodeIndex].textContent
        : p.childNodes[endNodeIndex].nodeValue;
  }
</script>

<div>
  <div>{outerHTML}</div>
  <div>{startNode}</div>
  <div>{endNode}</div>
  <div class="flex">
    <p>range :</p>
    <p id="p">
      Example: <i>italic</i> and <b>b<span>ol</span>d</b>
    </p>
  </div>
  <div class="felx">
    <p>result :</p>
    <p id="result" />
  </div>

  <div class="mt-10">
    <p>node</p>
    <div>
      <input id="start" type="number" bind:value={startNodeIndex} />
      <input id="end" type="number" bind:value={endNodeIndex} />
    </div>
    <p>offset</p>
    <div>
      <input id="start" type="number" bind:value={startOffset} />
      <input id="end" type="number" bind:value={endOffset} />
    </div>
    <button id="button" on:click={setSelection}>set selection</button>

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
