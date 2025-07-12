import {
  getCraftUri,
  getCraftCurrentSite,
  getCraftEntry,
  CraftPage,
} from '@query-api/next/server'
import { CraftPageBase } from '@/types/base'

export default async function CraftCatchPage() {
  const uri = await getCraftUri()
  const { id } = await getCraftCurrentSite()

  const { data, error } = await getCraftEntry<CraftPageBase>()
    .uri(uri)
    .siteId(id)
    .one()

  if (error || !data) {
    console.error(error)
    throw new Error(error?.message || 'No data returned from Craft API')
  }

  return <CraftPage content={data} />
}
