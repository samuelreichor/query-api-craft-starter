import RelatedNews from '@/components/RelatedNews'
import { CraftArea } from '@query-api/next'
import { CraftPageHome } from '@/types/base'
import RichText from '@/components/RichText'

export default function News(props: CraftPageHome) {
  return (
    <div>
      <h1>{props.translatablePlainText}</h1>
      {props.richText && <RichText text={props.richText} />}
      <CraftArea content={props.contentBuilder} />

      <h2>Related News</h2>
      <RelatedNews />
    </div>
  )
}
