import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    products: [],
    column: 'id',
    sort: 'desc',
  },
  getters: {
    dataProducts(state) {
      return state.products;
    },
    getColumn(state) {
      return state.column;
    },
    getSort(state) {
      return state.sort;
    },
  },

  mutations: {

  },
  actions: {

  }
})