<template>
  <div>
    <h1>Busca de Operadoras</h1>
    <BuscarOperadora />
  </div>
</template>

<script>
import BuscarOperadora from "./components/index.vue";

export default {
  components: {
    BuscarOperadora,
  },
};
</script>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
