import { CraftArea } from '@query-api/next'
import { CraftPageHome } from '@/types/base'
import RichText from '@/components/RichText'

export default function Home(props: CraftPageHome) {
  return (
    <>
      <h1>{props.translatablePlainText}</h1>
      {props.richText && <RichText text={props.richText} />}
      <CraftArea content={props.contentBuilder} />
    </>
  )
}
