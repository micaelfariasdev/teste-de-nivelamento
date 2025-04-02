<template>
    <div>
      <input
        v-model="busca"
        @input="buscarOperadora"
        placeholder="Digite o nome da operadora"
      />
      <ul v-if="resultados.length">
        <li v-for="operadora in resultados" :key="operadora.CNPJ">
          <strong>{{ operadora.Nome_Fantasia }}</strong> - {{ operadora.Cidade }} ({{ operadora.UF }})
        </li>
      </ul>
      <p v-else-if="busca.length >= 3">Nenhuma operadora encontrada.</p>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  
  export default {
    data() {
      return {
        busca: "",
        resultados: [],
      };
    },
    methods: {
      async buscarOperadora() {
        if (this.busca.length < 1) {
          this.resultados = [];
          return;
        }
        try {
          const { data } = await axios.get(`http://127.0.0.1:5000/buscar_operadora?q=${this.busca}`);
          this.resultados = data;
        } catch (error) {
          console.error("Erro ao buscar operadora:", error);
          this.resultados = [];
        }
      },
    },
  };
  </script>
  
<style scoped>
.read-the-docs {
  color: #888;
}
</style>
