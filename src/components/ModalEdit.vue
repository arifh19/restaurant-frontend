<template>
    <div>
      <b-modal id="modal-edit" ref="modal" title="Edit Item" @show="resetModal"  @hidden="resetModal" @ok="handleOk" ok-title="Update" >
        <form ref="form" @submit.stop.prevent="handleSubmit">
          <b-form-group :state="nameState" label="Name" label-for="name-input" label-cols="3" invalid-feedback="Name is required" style="font-weight: bold">
            <b-form-input id="name-input" v-model="name" :state="nameState" required ></b-form-input>
          </b-form-group>
          <b-form-group :state="imageState" label="Image" label-for="image-input" label-cols="3" invalid-feedback="Image is required" style="font-weight: bold">
            <b-form-file v-if="!image" @change="onFileChange" id="image-input" v-model="image" :state="imageState" placeholder="Choose a image or drop it here..." drop-placeholder="Drop file here..." required></b-form-file>
            <img v-if="image" :src="image" />
            <button v-if="image"  class="btn btn-danger" @click="removeImage">Remove image</button>
          </b-form-group>
          <b-form-group :state="priceState" label="Price" label-for="price-input" label-cols="3" invalid-feedback="Price is required" style="font-weight: bold">
            <b-form-input id="price-input" v-model="price" :state="priceState" type="number" min="0" required ></b-form-input>
          </b-form-group>
          <b-form-group :state="stockState" label="Stock" label-for="stock-input" label-cols="3" invalid-feedback="Stock is required" style="font-weight: bold">
            <b-form-input id="stock-input" v-model="stock" :state="stockState" type="number" min="0"  required ></b-form-input>
          </b-form-group>
          <b-form-group :state="categoryState" label="Category" label-for="category-input" label-cols="3" invalid-feedback="Category is required" style="font-weight: bold">
            <b-form-select id="category-input" v-model="category_id" :state="categoryState" required :options="options"></b-form-select>
          </b-form-group>
        </form>
      </b-modal>
    </div>
</template>

<script>
export default {
    name: 'Modal-Edit',
    data() {
      return {
        nameState: null,
        imageState: null,
        priceState: null,
        stockState: null,
        categoryState: null,
        name : null, 
        image : null,
        price : null,
        stock : null,
        category_id : null,
        submittedNames: [],
        options: [
          { value: 0, text: 'Please select a Category', disabled: true },
          { value: 1, text: 'Makanan' },
          { value: 2, text: 'Minuman' },
          { value: 3, text: 'Snack' },
        ],
        data : {
          id: 1,
          name: "Espresso",
          image: "http://localhost:13000/static/4d9710383b5d4109b0f7c78bd6fed5bf",
          stock: 5,
          price: 2000,
          category_id: 2,
        },
      }
    },
    // props : {
    //   id : {
    //     required : true
    //   }
    // },

    methods: {
      checkFormValidity() {
        const valid = this.$refs.form.checkValidity()
        this.nameState = valid
        this.imageState = valid
        this.priceState = valid
        this.stockState = valid
        this.categoryState = valid
        return valid
      },
      resetModal() {
        this.name = this.data.name
        this.image = this.data.image
        this.stock = this.data.stock
        this.price = this.data.price
        this.category_id = this.data.category_id
      },
      handleOk(bvModalEvt) {
        // Prevent modal from closing
        bvModalEvt.preventDefault()
        // Trigger submit handler
        this.handleSubmit()
      },
      handleSubmit() {
        // Exit when the form isn't valid
        if (!this.checkFormValidity()) {
          return
        }
        // Push the name to submitted names
        this.submittedNames.push(this.name)
        // Hide the modal manually
        this.$nextTick(() => {
          this.$bvModal.hide('modal-prevent-closing')
        })
      },
      onFileChange(e) {
        var files = e.target.files || e.dataTransfer.files;
        if (!files.length)
          return;
        this.createImage(files[0]);
      },
      createImage(file) {
        let reader = new FileReader();
        reader.onload = (e) => {
          this.image = e.target.result;
        };
        reader.readAsDataURL(file);
      },

      removeImage: function () {
        this.image = '';
      }
    },

  }
</script>

<style scoped>
img {
  width: 50%;
  display: block;
  margin-bottom: 10px;
}
</style>