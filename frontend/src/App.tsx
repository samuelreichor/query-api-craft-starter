import { Route, Routes, Link, useLocation } from 'react-router'
import CraftRouter from './CraftRouter'
import { CraftProvider, getCraftLocation } from '@query-api/react'
import { craftConfig } from './libs/query-api'

export function App() {
  const location = getCraftLocation(useLocation())
  return (
    <CraftProvider config={craftConfig} location={location}>
      <div>
        <ul role="navigation">
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/de">Home DE</Link>
          </li>
          <li>
            <Link to="/es">Home ES</Link>
          </li>
          <li>
            <Link to="/news/cat-teaches-yoga">Cat Teaches Yoga</Link>
          </li>
          <li>
            <Link to="/news/cat-becomes-mayor">Cat Becomes Mayor</Link>
          </li>
        </ul>
        <Routes>
          <Route path="*" element={<CraftRouter />} />
        </Routes>
      </div>
    </CraftProvider>
  )
}

export default App
