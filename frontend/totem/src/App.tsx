import { useContext } from "react"
import { InformationsContext } from "./contexts/informationsProvider"

function App() {
	const {CPF, setCPF} = useContext(InformationsContext)

	function handleCPF() {
		setCPF('123.456.789-00')
	}
	return (
		<div>
			<h1>hello</h1>
			<p>{CPF}</p>
		</div>
	)
}

export default App
