import Link from 'next/link'
import { CraftClientProvider } from '@query-api/next'
import { craftConfig } from '@/libs/query-api'

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <CraftClientProvider config={craftConfig}>
      <html lang="en">
        <body>
          <ul>
            <li>
              <Link href="/">Home</Link>
            </li>
            <li>
              <Link href="/de">Home DE</Link>
            </li>
            <li>
              <Link href="/es">Home ES</Link>
            </li>
            <li>
              <Link href="/news/cat-teaches-yoga">Cat Teaches Yoga</Link>
            </li>
            <li>
              <Link href="/news/cat-becomes-mayor">Cat Becomes Mayor</Link>
            </li>
          </ul>
          {children}
        </body>
      </html>
    </CraftClientProvider>
  )
}
