<template>
  <div>
    <main class="foods">
      <div v-for="item in products" :key="item.id">
        <article class="imageandtext image_grid ">
          <label>
              <img :src="item.image" :alt="item.name" @click="addCart(item, isCheck(item))">
              <input v-if="isCheck(item)" type="checkbox" disabled checked>
              <input v-if="!isCheck(item)" type="checkbox" disabled>
              <span class="caption">
              </span>
          </label>
          <div class="row">
            <div class="col-6">
                <p>{{ item.name }}</p>
                <p class="harga">{{ toRupiah(item.price) }}</p>
            </div>
            <div class="col-6 right">
              <b-dropdown variant="none" toggle-class="text-decoration-none p-0 font-color-black" menu-class="h4" no-caret>
                <template v-slot:button-content>
                  <b-icon icon="three-dots-vertical"></b-icon>
                </template>
                <b-dropdown-item v-b-modal.modal-edit>Edit</b-dropdown-item>
                <b-dropdown-item >Delete</b-dropdown-item>
              </b-dropdown>
            </div>
          </div>
        </article>
      </div>
    </main>
    <!-- <Modal /> -->
    <ModalEdit />
  </div>
</template>

<script>
  import ModalEdit from "@/components/ModalEdit";

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
    data : () =>{
      return {
        options: [
          { value: null, text: 'Please select some item' },
          { value: 'a', text: 'This is First option' },
          { value: 'b', text: 'Default Selected Option' },
          { value: 'c', text: 'This is another option' },
          { value: 'd', text: 'This one is disabled', disabled: true }
        ]
      }
    },
    components :{
      ModalEdit
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


