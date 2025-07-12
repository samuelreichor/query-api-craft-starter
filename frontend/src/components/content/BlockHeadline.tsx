import type { CraftEntryTypeHeadline } from '../../types/base'

export default function Headline(props: CraftEntryTypeHeadline) {
  const Tag = props.selectHeadlineTag.value
  return <Tag>{props.title}</Tag>
}
