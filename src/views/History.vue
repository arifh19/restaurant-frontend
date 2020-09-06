<template>
  <div class="history">
    <main>
     <Header title="History"/>
      <div class="main">
        <SideBar />
        <main class="content-history table-responsive">
          <div class="row flex-history">
            <div class="col-12 col-sm-3 today-income card">
              <p>Today's Income</p>
              <p class="nominal">Rp. 1.000.0000</p>
              <p>+2% Yesterday</p>
            </div>
            <div class="col-12 col-sm-3 orders card">
              <p>Orders</p>
              <p class="nominal">Rp. 3.270</p>
              <p>+5% Last Week</p>
            </div>
            <div class="col-12 col-sm-3 year-income card">
              <p>The Year's Income</p>
              <p class="nominal">Rp. 100.000.0000</p>
              <p>+10% Last Year</p>
            </div>
          </div>
          <div class="table-responsive revenue card">
            <h4>Revenue</h4>
            <img src="@/assets/grafik.png" alt="" />
          </div>
          <Table />
        </main>
      </div>
    </main>
  </div>
</template>

<script>
  import Header from "@/components/Header";
  import SideBar from "@/components/SideBar";
  import Table from "@/components/Table";

  export default {
    name: "history",
    components : {
      Header,
      SideBar,
      Table
    }
  };
</script>

<style></style>
