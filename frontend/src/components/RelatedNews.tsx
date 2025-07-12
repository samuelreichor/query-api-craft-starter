'use client'

import {
  useCraftUri,
  useCraftEntry,
  useCraftCurrentSite,
} from '@query-api/next'

export default function RelatedNews() {
  const uri = useCraftUri()
  const { id } = useCraftCurrentSite()
  const { data, loading, error } = useCraftEntry().uri(uri).siteId(id).one()

  if (error) {
    console.error(error)
  }

  if (loading) return <p>Loading...</p>
  return <pre>{JSON.stringify(data, null, 2)}</pre>
}
