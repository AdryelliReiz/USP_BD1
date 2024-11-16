import { useContext } from "react";
import { InformationsContext } from "../../contexts/informationsProvider"
import TicketCard, {ITicketCardProps} from "../../components/ticketCard";

import "./styles.scss"

//ITicketCardProps[]
const tickets: Array<ITicketCardProps> = [
    {
        name: "Inteira",
        value: 24,
        type: "monetario"
    },
    {
        name: "Meia",
        value: 12,
        type: "monetario"
    },
    {
        name: "Club",
        value: 240,
        type: "pontos"
    }
]

export default function Tickets() {
    const {tabActive, setTabActive} = useContext(InformationsContext)
    return (
        <div className="tickets-container" >
            <div className="t-content">
                <div className="t-header">
                    <h1>CINEACH</h1>
                </div>

                <div className="t-title" >
                    <h2>SELECIONE SEUS INGRESSOS</h2>
                </div>

                <div className="t-session-information" >
                    <h3>Deadpool & Wolverine</h3>
                    <p><strong>Sessão - 20h30</strong></p>
                    <p>Assentos: J8, J9</p>
                </div>

                <div className="t-tickets" >
                    {tickets.map((ticket, index) => (
                        <TicketCard 
                            key={index} 
                            name={ticket.name}
                            value={ticket.value}
                            type={ticket.type}
                        />
                    ))}
                </div>

                <div className="t-footer">
                    <p>Pontos: 300</p>
                    <div className="t-buttons" >
                        <button onClick={() => setTabActive(tabActive - 1)} >
                            Voltar
                        </button>

                        <button onClick={() => setTabActive(tabActive + 1)} >
                            0 / 2 ingressos selecionados
                        </button>
                    </div>
                </div>
            </div>
        </div>
    )
}