import type { CraftEntryTypeText } from '@/types/base'
import RichText from '../RichText'

export default function BlockRichText(props: CraftEntryTypeText) {
  return <>{props.richText && <RichText text={props.richText} />}</>
}
