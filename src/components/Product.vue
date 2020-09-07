<template>
  <div>
    <main class="foods">
      <div v-for="item in products" :key="item.id">
        <article class="imageandtext image_grid ">
          <label>
            <img
              :src="item.image"
              :alt="item.name"
              @error="imageUrlAlt"
              @click="addCart(item, isCheck(item))"
            />
            <input v-if="isCheck(item)" type="checkbox" disabled checked />
            <input v-if="!isCheck(item)" type="checkbox" disabled />
            <span class="caption"> </span>
          </label>
          <div class="row">
            <div class="col-6">
              <p>{{ item.name }}</p>
              <p class="harga">{{ toRupiah(item.price) }}</p>
            </div>
            <div class="col-6 right">
              <b-dropdown
                variant="none"
                toggle-class="text-decoration-none p-0 font-color-black"
                menu-class="h4"
                no-caret
              >
                <template v-slot:button-content>
                  <b-icon icon="three-dots-vertical"></b-icon>
                </template>
                <b-dropdown-item v-b-modal.modal-edit @click="itemId = item.id"
                  >Edit</b-dropdown-item
                >
                <b-dropdown-item @click="deleteProduct(item.id)"
                  >Delete</b-dropdown-item
                >
              </b-dropdown>
            </div>
          </div>
        </article>
      </div>
    </main>
    <ModalEdit :id="itemId" :getProduct="getProduct" />
  </div>
</template>

<script>
  import ModalEdit from "@/components/ModalEdit";
  import defaultImg from "@/assets/null-image.jpg";
  import axios from "axios";

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
      getProduct: {
        type: Function,
        required: false,
      },
    },
    data: () => {
      return {
        imgError: defaultImg,
        itemId: null,
        config: {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        },
      };
    },
    components: {
      ModalEdit,
    },
    methods: {
      deleteProduct: async function(id) {
        try {
          const response = await axios.delete(
            `http://127.0.0.1:13000/product/${id}`,
            this.config
          );
          console.log(response);
          this.getProduct();
        } catch (error) {
          console.error(error);
        }
      },
      imageUrlAlt(event) {
        event.target.src = this.imgError;
      },
      toRupiah(value) {
        return (
          "Rp. " +
          value.toString().replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1.")
        );
      },
      addCart(item, isCheck) {
        if (!isCheck) {
          let data = {
            ...item,
            amount: 1,
          };
          this.items.data.push(data);
        } else {
          let findIndex = this.items.data.findIndex(
            (index) => index.id === item.id
          );
          this.items.data.splice(findIndex, 1);
        }
      },
    },
    computed: {
      isCheck: function() {
        return (item) => this.items.data.find((index) => index.id === item.id);
      },
      getId: function() {
        return this.itemId;
      },
    },
  };
</script>

<style scoped>
  img {
    width: 250px;
    height: 200px;
  }
</style>
