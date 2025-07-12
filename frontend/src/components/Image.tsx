import type { CraftAsset, CraftAssetRatio } from '../types/base'

type CraftAssetRatioValue = keyof CraftAssetRatio

type ImageProps = {
  image: CraftAsset
  ratio?: CraftAssetRatioValue
  className?: string
  style?: React.CSSProperties
}

function calculateHeight(
  width: number,
  ratio: CraftAssetRatioValue,
  image: CraftAsset
) {
  if (ratio === 'auto') return image.height
  const [ratioWidth, ratioHeight] = ratio.split(':').map(Number)
  return (width * ratioHeight) / ratioWidth
}

export default function Image({ image, ratio = 'auto', style }: ImageProps) {
  if (!image) return null
  const { url, width, focalPoint, alt, srcSets } = image
  const imgStyle: React.CSSProperties = { ...style }
  if (focalPoint) {
    imgStyle.objectPosition = `${focalPoint.x * 100}% ${focalPoint.y * 100}%`
  }
  return (
    <img
      src={url}
      srcSet={srcSets && srcSets[ratio] ? srcSets[ratio] : undefined}
      width={width}
      height={calculateHeight(width, ratio, image)}
      alt={alt || ''}
      style={imgStyle}
    />
  )
}
