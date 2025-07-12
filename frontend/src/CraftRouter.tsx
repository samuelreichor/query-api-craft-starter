import {
  CraftPage,
  useCraftCurrentSite,
  useCraftEntry,
  useCraftUri,
} from '@query-api/react'
import type { CraftPageBase } from './types/base'

export default function CraftRouter() {
  const uri = useCraftUri()
  const { id: siteId } = useCraftCurrentSite()

  const { data, loading, error } = useCraftEntry<CraftPageBase>()
    .uri(uri)
    .siteId(siteId)
    .one()

  if (error) {
    console.error(error)
  }
  return <div>{!loading && data && <CraftPage content={data} />}</div>
}
