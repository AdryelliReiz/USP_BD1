import { useContext, useEffect, useState } from "react";
import { InformationsContext } from "../../contexts/informationsProvider";
import TicketCard from "../../components/ticketCard";
import "./styles.scss";
import api from "../../services/api";

type Ticket = {
    tipo: number
    valor: number;
    nome: string;
    tipo_pago: "monetario" | "pontos";
}

type Data = {
    pontos: number
    ingressos: Ticket[]
}

export default function Tickets() {
    const { tabActive, setTabActive, selectedTickets, setSelectedTickets, CPF, selectedSeats, selectedSession } = useContext(InformationsContext);

    const [allTickets, setAllTickets] = useState<Ticket[]>([]);
    const [pontos, setPontos] = useState<number>(0);  
   

    const updateSelection = (name: string, quantity: number) => {
        if (quantity < 0) return false;
        //conta todos os ingressos selecionados
        const selected = selectedTickets.reduce((total, ticket) => total + ticket.quantity, 0);
        if ((selectedSeats.length - selected) > 0) return false;
        setSelectedTickets( selectedTickets.map((ticket) => ticket.name === name ? { ...ticket, quantity } : ticket) );

        return true;
    };

    const confirmarIngressos = () => {
        if(selectedTickets.reduce((total, ticket) => total + ticket.quantity, 0) === 0 
            || selectedTickets.reduce((total, ticket) => total + ticket.quantity, 0) !== selectedSeats.length
        ) return;

        setTabActive(tabActive + 1);
    };

    useEffect(() => {
        async function fetchTickets() {
            const { data } = await api.get<Data>(`/totem/tickets/${selectedSession}/?cpf=${CPF}`);

            console.log(data)
            setAllTickets(data.ingressos);
            setPontos(data.pontos);
        }

        fetchTickets();
    }, [])

    return (
        <div className="tickets-container">
            <div className="t-content">
                <div className="t-header">
                    <h1>CINEACH</h1>
                </div>

                <div className="t-title">
                    <h2>SELECIONE SEUS INGRESSOS</h2>
                </div>

                <div className="t-session-information">
                    <h3>Deadpool & Wolverine</h3>
                    <p><strong>Sessão - 20h30</strong></p>
                    <p>Assentos: {selectedSeats.map(seat => <span>{seat} </span>)}</p>
                </div>

                <div className="t-tickets">
                    {allTickets.map((ticket, index) => (
                        <TicketCard
                            key={index}
                            name={ticket.nome}
                            value={ticket.valor}
                            type={ticket.tipo_pago}
                            onQuantityChange={(quantity) => updateSelection(ticket.nome, quantity)}
                        />
                    ))}
                </div>

                <div className="botoes-container">
                    <button className="voltar-button" onClick={() => setTabActive(tabActive - 1)}>
                        Voltar
                    </button>

                    {CPF != "" && (
                        <div className="pontos">
                            <p>Pontos: {pontos}</p>
                        </div>
                    )}

                    <div className="tickets-i">
                        <p>{selectedTickets.reduce((total, seat) => total + seat.quantity, 0)} Ingressos Selecionados</p>

                        <button className="ingressos-button" onClick={confirmarIngressos}>
                            Comprar ingressos
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
