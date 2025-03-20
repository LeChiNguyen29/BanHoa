<script setup>
import Footer from './components/Footer.vue';
import Header from './components/Header.vue';


</script>

<template>
  <div id="app" class="d-flex flex-column min-vh-100">
    <Header></Header>
    <main class="flex-grow-1" style="margin-top: 50px;">
      <RouterView></RouterView>
    </main>
    <Footer></Footer>
  </div>
</template>