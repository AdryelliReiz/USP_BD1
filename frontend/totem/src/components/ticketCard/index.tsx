import {useState} from "react";
import {
    BiPlus,
    BiMinus
} from "react-icons/bi";

import "./styles.scss";

export type ITicketCardProps = {
    name: string;
    type: "pontos" | "monetario";
    value: number;
}

export default function TicketCard({
    name,
    type,
    value
}: ITicketCardProps) {
    const [selectedTickets, setSelectedTickers] = useState(0);
    // Pegar o número de assentos escolhidos
    // Pegar a lista de tickets escolhidos

    function toggleSelectedTickets(type: "minus" | "plus") {
        // Lógica para adicionar ou remover um ticket da lista de tickets

        if(type == "minus" && selectedTickets > 0) {
            setSelectedTickers(selectedTickets - 1);
        } else if(type == "plus") {
            /* adicionar esse ticket na lista de tickets não pode ultrapassar o número de assentos escolhidos*/
            setSelectedTickers(selectedTickets + 1)
        }
    }

    return (
        <div className="card-container" >
            <div className="c-info">
                <p><strong>{name}</strong></p>
                <p>
                    {type == "monetario" && "R$ "}
                    {value}
                    {type == "pontos" && " pontos"}
                </p>
            </div>

            <div className="c-selector-tickets" >
                <button onClick={() => toggleSelectedTickets("minus")} >
                    <BiMinus size={18} />
                </button>
                <div>{selectedTickets}</div>
                <button onClick={() => toggleSelectedTickets("plus")} >
                    <BiPlus size={18} />
                </button>
            </div>
        </div>
    );
}