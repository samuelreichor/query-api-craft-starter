import type { CraftPageNews } from '../../types/base'
import RichText from '../RichText'
import { CraftArea } from '@query-api/react'

export default function News(props: CraftPageNews) {
  return (
    <div>
      <h1>{props.translatablePlainText}</h1>
      {props.richText && <RichText text={props.richText} />}
      <CraftArea content={props.contentBuilder} />
    </div>
  )
}
