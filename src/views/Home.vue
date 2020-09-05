<template>
  <div class="content">
    <aside class="left-side">
      <Header title="Food Items" :search="true"/>
      <div class="main">
        <SideBar />
        <Product :data="data" />
      </div>
    </aside>
    <aside class="right-side">
      <header>
        <h1>
          Cart <span class="jumlah-cart"><p>{{countItem}}</p></span>
        </h1>
      </header>
      <main v-if="countItem === 0">
        <img
          class="cart-img"
          src="@/assets/food-and-restaurant.png"
          alt="food-and-restaurant"
        />
        <p class="cart">Your cart is empty</p>
        <p class="message">Please add some items from the menu</p>
      </main>
       <main v-if="countItem > 0">
          <div class="container flex-column">
              <Item :data="item" />
              <div class="cart-checkout">
                  <div class="cart-total"><span>Total :</span> <span>Rp. 105.000*</span></div>
                  <p>*Belum termasuk ppn</p>
                  <button id="checkout" class="btn btn-primary checkout-btn">Checkout</button>
                  <a href="index.html" class="btn btn-danger cancel-btn">Cancel</a>
              </div>
          </div>
        </main>
    </aside>
  </div>
</template>

<script>
  import Header from "@/components/Header";
  import SideBar from "@/components/SideBar";
  import Product from "@/components/Product";
  import Item from "@/components/Item";
  const products = [
    {
      id: 1,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 2,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 3,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 4,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 5,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 6,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 7,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 8,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 9,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 10,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 11,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 12,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 13,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 14,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    {
      id: 15,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
  ];
  const items = [
    {
      id: 1,
      name: "Espresso",
      image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
      price: 2000,
    },
    
  ]
  console.log(items.length)
  export default {
    name: "Home",
    components: {
      Header,
      SideBar,
      Product,
      Item
    },
    data: () => {
      return {
        img: "@/assets/jeremy-ricketts-6ZnhM-xBpos-unsplash.png",
        data: products,
        item : items,
        countItem : items.length
      };
    },
    methods: {
      getProduct() {},
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
