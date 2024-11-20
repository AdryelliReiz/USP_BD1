import { useContext } from "react";
import { InformationsContext } from "./contexts/informationsProvider"
import Welcome from "./templates/welcome";
import Tickets from "./templates/tickets";
import Cinemas from "./templates/cinemas";
import Identification from "./templates/identification";
import Payment from "./templates/payment";
import End from "./templates/end";


function App() {
	const {tabActive} = useContext(InformationsContext)

	return (
		<main>
			{
				tabActive == 0 ? <Welcome />
				: tabActive == 1 ? <Tickets />
				: tabActive == 2 ? <Cinemas />
				: tabActive == 3 ? <Identification />
				: tabActive == 4 ? <Payment />
				: tabActive == 5 ? <End />
				:null
			}
		</main>
	);
}

export default App;
