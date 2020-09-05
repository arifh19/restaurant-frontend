<template>
  <div>
    <main class="foods">
      <div v-for="item in data" :key="item.id">
        <article class="imageandtext image_grid">
          <label>
              <img :src="item.image" :alt="item.name">
              <input type="checkbox">
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
      data: {
        required: true,
      },
    },
    methods : {
      toRupiah (value){
        return "Rp. " + value.toString().replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1.")
      }
    },
  };
</script>

<style scoped>

</style>
