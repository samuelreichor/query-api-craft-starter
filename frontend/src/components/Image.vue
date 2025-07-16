<script setup lang="ts">
import type {
  CraftAsset,
  CraftAssetFocalPoint,
  CraftAssetRatio,
} from '@/types/base'

type CraftAssetRatioValue = keyof CraftAssetRatio
type ImageProps = {
  image: CraftAsset
  ratio?: CraftAssetRatioValue
}
const { image, ratio = 'auto' } = defineProps<ImageProps>()

function calculateHeight(
  width: number,
  ratio: CraftAssetRatioValue,
  image: CraftAsset
) {
  if (ratio === 'auto') return image.height
  const [ratioWidth, ratioHeight] = ratio.split(':').map(Number)
  if (ratioWidth && ratioHeight) {
    return (width * ratioHeight) / ratioWidth
  }
  console.error(
    'Something went wrong in calculateHeight(), please check the ratio.'
  )
}

function getFocalPointStyle(focalPoint: CraftAssetFocalPoint) {
  return `object-position: ${focalPoint.x * 100}% ${focalPoint.y * 100}%;`
}
</script>

<template>
  <img
    :src="image.url"
    :srcSet="
      image.srcSets && image.srcSets[ratio] ? image.srcSets[ratio] : undefined
    "
    :width="image.width"
    :height="calculateHeight(image.width, ratio, image)"
    :alt="image.alt || ''"
    :style="[
      getFocalPointStyle(image.focalPoint),
      'width: 100%; height: 100%; object-fit: contain',
    ]"
  />
</template>
