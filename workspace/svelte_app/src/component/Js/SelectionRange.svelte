<script lang="ts">
  import { onMount } from "svelte";

  let p: HTMLElement;
  let result;
  let buttons;

  let range: Range;

  let startOffset: number = 0;
  let endOffset: number = 0;

  let startNodeIndex: number = 0;
  let endNodeIndex: number = 0;

  let startNode;
  let endNode;

  onMount(() => {
    range = new Range();
    p = document.getElementById("p");
    result = document.getElementById("result");
    buttons = document.getElementById("buttons");

    resetExample();
  });

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
  const EXAMPLE = `<p>ひとつめ<span>ふたつめ</span><b>みっつめふとじ<span>（こども）</span>だよ</b></p>`;
  function resetExample() {
    p.innerHTML =
      "ひとつめ<span class='text-blue-600'>ふたつめ</span><b class='text-green-600'>みっつめはふとじ<span class='text-black'>（こども）</span>だよ</b>";
    result.innerHTML = "";

    range.setStart(p.childNodes[startNodeIndex], startOffset);
    range.setEnd(p.childNodes[endNodeIndex], endOffset);

    window.getSelection().removeAllRanges();
    window.getSelection().addRange(range);
  }

  function setSelection() {
    try {
      range.setStart(p.childNodes[startNodeIndex], startOffset);
      range.setEnd(p.childNodes[endNodeIndex], endOffset);
      console.dir("【ログ: range】", range);
      document.getSelection().removeAllRanges();
      document.getSelection().addRange(range);

      startNode =
        p.childNodes[startNodeIndex].nodeType === 1
          ? p.childNodes[startNodeIndex].textContent
          : p.childNodes[startNodeIndex].nodeValue;

      endNode =
        p.childNodes[endNodeIndex].nodeType === 1
          ? p.childNodes[endNodeIndex].textContent
          : p.childNodes[endNodeIndex].nodeValue;

      console.log("【ログ: range】", range);
    } catch (e) {
      alert(e);
    }
  }
</script>

<div>
  <div>【例】{EXAMPLE}</div>
  <div>
    <span>【スタートノード】</span>
    {startNode}
  </div>
  <div><span>【エンドノード】</span>{endNode}</div>
  <div class="flex">
    <p>range :</p>
    <p id="p" class="text-red-600" />
  </div>
  <div class="felx">
    <p>result :</p>
    <p id="result" />
  </div>

  <div class="mt-10">
    <div class="flex">
      <div>
        <p>start container</p>
        <input id="start" type="number" bind:value={startNodeIndex} />
      </div>
      <div>
        <p>start offset</p>
        <input id="start" type="number" bind:value={startOffset} />
      </div>
    </div>
    <div class="flex">
      <div>
        <p>end container</p>
        <input id="end" type="number" bind:value={endNodeIndex} />
      </div>
      <div>
        <p>end offset</p>
        <input id="end" type="number" bind:value={endOffset} />
      </div>
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
