import RichText from '../RichText'
import type { CraftPageHome } from '../../types/base'
import { CraftArea, useCraftEntry } from '@query-api/react'

export default function Home(props: CraftPageHome) {
  const {
    data: news,
    loading,
    error,
  } = useCraftEntry<CraftPageHome[]>()
    .section('news')
    .limit(3)
    .fields(['title'])
    .all()

  if (error) {
    console.error(error)
  }

  return (
    <div>
      <h1>{props.translatablePlainText}</h1>
      {props.richText && <RichText text={props.richText} />}
      <CraftArea content={props.contentBuilder} />

      <h2>Related News</h2>

      {!loading && news && (
        <ul>
          {news.map((item, idx) => (
            <li key={idx}>
              <a href={item.metadata.url}>{item.title}</a>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
