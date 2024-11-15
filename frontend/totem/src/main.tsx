import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { InformationsProvider } from './contexts/informationsProvider.tsx'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
	<InformationsProvider>
		<App />
	</InformationsProvider>
  </StrictMode>,
)
