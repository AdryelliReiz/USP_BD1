import { useContext } from "react";
import { InformationsContext } from "./contexts/informationsProvider"
import Welcome from "./templates/welcome";
import Tickets from "./templates/tickets";
import Cinemas from "./templates/cinemas";
import Identification from "./templates/identification";
import Payment from "./templates/payment";
import End from "./templates/end";
import Session from "./templates/session";
import Catalogo from "./templates/catalogo";


function App() {
	const {tabActive} = useContext(InformationsContext)

	return (
		<main>
			{
				tabActive == 0 ? <Welcome />
				: tabActive == 4 ? <Tickets />
				: tabActive == 1 ? <Cinemas />
				: tabActive == 2 ? <Identification />
				: tabActive == 5 ? <Session />
				: tabActive == 6 ? <Payment />
				: tabActive == 7 ? <End />
				:tabActive == 3 ? <Catalogo />
				:null
			}
		</main>
	);
}

export default App;
