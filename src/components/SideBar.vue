<template>
  <div>
    <aside class="sidebar">
      <ul>
          <router-link :to="{ name: 'home' }"
          ><li><img src="@/assets/fork.png" alt="fork" /></li
        ></router-link>
        <router-link :to="{ name: 'history' }"
          ><li><img src="@/assets/clipboard.png" alt="clipboard" /></li
        ></router-link>
        <li><img src="@/assets/add.png" alt="add" /></li>
      </ul>
    </aside>
  </div>
</template>

<script>
  export default {};
</script>

<style></style>
