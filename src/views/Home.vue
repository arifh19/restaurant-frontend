<template>
  <div class="content">
    <aside class="left-side">
      <Header title="Food Items" :search="true" />
      <div class="main">
        <SideBar />
        <Product :products="data" :items="item" />
      </div>
    </aside>
    <aside class="right-side">
      <Header title="Cart" :isCart="true" :totalCart="totalCart" />
      <main>
        <EmptyCart v-if="totalCart === 0" />
        <div v-if="totalCart > 0" class="container flex-column">
          <Cart :items="item" />
        </div>
      </main>
    </aside>
  </div>
</template>

<script>
  import Header from "@/components/Header";
  import SideBar from "@/components/SideBar";
  import Product from "@/components/Product";
  import Cart from "@/components/Cart";
  import EmptyCart from "@/components/EmptyCart";

  const products = [
    {
      id: 1,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 2,
      name: "Chocolate",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 3,
      name: "Ayam",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 4,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 5,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 6,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 7,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 8,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 9,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 10,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 11,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 12,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 13,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 14,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
    {
      id: 15,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      stock: 5,
      price: 2000,
    },
  ];

  const items = {
    cashier: "Arif Hidayat",
    ppn: 0.1,
    invoice: "#010410919",
    data: [],
    totalPrice: 0,
  };

  export default {
    name: "Home",
    components: {
      Header,
      SideBar,
      Product,
      Cart,
      EmptyCart,
    },

    data: () => {
      return {
        data: products,
        item: items,
        
      };
    },

    methods: {
      getProduct() {},
    },

    computed: {
      totalCart: function() {
        return this.item.data.length;
      },
    },
  };
</script>
<style scoped>
  header {
    padding-top: 1vh;
    padding-bottom: 1vh;
    border: 1px solid #cecece;
    height: 60px;
  }
</style>
