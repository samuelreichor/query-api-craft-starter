import { createRouter, createWebHistory } from 'vue-router'
import CraftRouter from '@/router/CraftRouter.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [{ path: '/:pathMatch(.*)*', component: CraftRouter }],
})
