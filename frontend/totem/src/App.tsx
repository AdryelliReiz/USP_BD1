import { useContext } from "react";
import { InformationsContext } from "./contexts/informationsProvider"
import Welcome from "./templates/welcome";
import Tickets from "./templates/tickets";
import Cinemas from "./templates/cinemas";
import Identification from "./templates/identification";

function App() {
	const {tabActive} = useContext(InformationsContext)

	return (
		<main>
			{
				tabActive == 0 ? <Welcome />
				: tabActive == 1 ? <Tickets />
				: tabActive == 2 ? <Cinemas />
				: tabActive == 3 ? <Identification />
				:null
			}
		</main>
	);
}

export default App;
