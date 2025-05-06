<template>
  <div class="home">
    <h1 class="home__title">Demo Docker Deploy 🐳</h1>
    <div class="home__buttons">
      <NuxtLink
        to="https://github.com/orpheebesson/demo-docker-deploy"
        target="_blank"
        rel="noopener noreferrer"
        class="button button--primary"
        >Voir le code source</NuxtLink
      >
      <NuxtLink
        to="https://www.orpheebesson.fr/blog/mettre-en-production-une-application-web-avec-docker"
        target="_blank"
        rel="noopener noreferrer"
        class="button button--secondary"
        >Lire l'article</NuxtLink
      >
    </div>
  </div>
</template>
<script setup lang="ts">
useHead({
  title: "Demo Docker Deploy",
  meta: [
    {
      name: "description",
      content: "Demo project for deploying an app with Docker.",
    },
  ],
});
</script>
