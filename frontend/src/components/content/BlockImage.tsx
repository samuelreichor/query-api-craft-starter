import type { CraftEntryTypeImage } from '../../types/base'
import Image from '../Image'

export default function BlockImage(props: CraftEntryTypeImage) {
  return <>{props.image && <Image image={props.image} ratio="3:2" />}</>
}
