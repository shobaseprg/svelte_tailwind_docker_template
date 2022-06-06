<script lang="ts">
  import { onMount } from "svelte";

  /**
   * カレンダーヘッド作成
   */
  function createHaed() {
    const week = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"];

    let table = "<table><tr>";
    for (let day of week) {
      const d = `<th>${day}</th>`;
      table += d;
    }
    table += "</tr><tr>";
    return table;
  }

  /**
   * 日曜を最終日に調整
   * @param today
   */
  function getDay(today: Date) {
    let day = today.getDay();
    if (day == 0) day = 7;
    return day - 1;
  }

  /**
   * カレンダーを作成
   */
  function createCalendar(elem: HTMLElement, year: number, month: number) {
    /**今月*/
    let toMonth = month - 1;
    /**本日のDATA*/
    let td = new Date(year, toMonth);

    let table = createHaed();

    // スペースを作る
    for (let i = 0; i < getDay(td); i++) {
      table += "<td></td>";
    }

    while (td.getMonth() == toMonth) {
      table += "<td>" + td.getDate() + "</td>";

      if (getDay(td) % 7 == 6) {
        table += "</tr><tr>";
      }

      td.setDate(td.getDate() + 1);
    }

    if (getDay(td) != 0) {
      for (let i = getDay(td); i < 7; i++) {
        table += "<td></td>";
      }
    }

    table += "</tr></table>";

    elem.innerHTML = table;
  }

  onMount(() => {
    const calendar = document.getElementById("calendar");
    createCalendar(calendar, 2022, 6);
  });
</script>

<div id="calendar" class="ml-10 mt-10" />

<style lang="postcss">
  table {
    border-collapse: collapse;
  }

  td,
  th {
    font-weight: bold;
    background-color: #e6e6e6;
    border: 5px solid black !important;
    padding: 3px;
    text-align: center;
  }
</style>
