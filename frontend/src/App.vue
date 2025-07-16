<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <div>
    <ul>
      <li>
        <RouterLink to="/">Home</RouterLink>
      </li>
      <li>
        <RouterLink to="/news/cat-teaches-yoga">Cat Teaches Yoga</RouterLink>
      </li>
      <li>
        <RouterLink to="/news/cat-becomes-mayor">Cat Becomes Mayor</RouterLink>
      </li>
    </ul>
    <RouterView />
  </div>
</template>
