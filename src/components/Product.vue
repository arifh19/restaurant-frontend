<template>
  <div>
    <main class="foods">
      <div v-for="item in products" :key="item.id">
        <article class="imageandtext image_grid">
          <label>
              <img :src="item.image" :alt="item.name" @click="addCart(item, isCheck(item))">
              <input v-if="isCheck(item)" type="checkbox" disabled checked>
              <input v-if="!isCheck(item)" type="checkbox" disabled>
              <span class="caption">
              </span>
          </label>
          <p>{{ item.name }}</p>
          <p class="harga">{{ toRupiah(item.price) }}</p>
        </article>
      </div>
    </main>
  </div>
</template>

<script>
  export default {
    name: "Product",
    props: {
      products: {
        required: true,
      },
      items: {
        type: Object,
        required: true,
      },
    },

    methods : {
      toRupiah (value){
        return "Rp. " + value.toString().replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1.")
      },
      addCart (item,isCheck){
        if (!isCheck){
          let data = {
             ...item,
            amount : 1,
          }
          this.items.data.push(data)
        }else {
          let findIndex = this.items.data.findIndex((index) => index.id === item.id)
          this.items.data.splice(findIndex, 1)
        }
      }
    },
    computed : {
      isCheck: function () {
        return item => this.items.data.find((index) => index.id === item.id)
      }
    }
  };
</script>
