import { createRouter, createWebHistory } from 'vue-router';
import CraftRouter from '@/router/CraftRouter.vue'; // next step

export const router = createRouter({
  history: createWebHistory(),
  routes: [{ path: '/:pathMatch(.*)*', component: CraftRouter }],
});