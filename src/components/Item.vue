<template>
  <div>
    <div class="cart-item">
      <div v-for="item in data" :key="item.id">
        <div class="cart-row mt-20">
          <div class="select-img">
            <img class="list-cart" :src="item.image" :alt="item.name" />
          </div>
          <div class="select-description">
            <p>{{ item.name }}</p>
            <div class="count-price">
              <div class="input-group">
                <button class="btn minus">-</button>
                <input disabled class="form-control total" value="1" />
                <button class="btn plus">+</button>
              </div>
              <p class="price">{{ toRupiah(item.price) }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
      name: 'Item',
      props : {
          data : {
              required: true
          }
      },
      methods : {
        toRupiah (value){
          return "Rp. " + value.toString().replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1.")
        }
    }, 
  };
</script>

<style></style>
