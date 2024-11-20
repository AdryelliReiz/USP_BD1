import { useContext } from "react";
import { InformationsContext } from "../../contexts/informationsProvider";
import "./styles.scss";

export default function End() {
    const {setTabActive } = useContext(InformationsContext);

    return (
        <div className="compra-confirmada">
            <h1>CINEACH</h1>
            <h2>Pagamento realizado com sucesso!</h2>
            <div className="icone">
                {/* Aqui você pode adicionar o ícone de sucesso, como uma imagem ou SVG */}
            </div>
            <p>Retire seu ticket na maquininha ao lado</p>
            
            <button 
                className="btn-voltar-inicio" 
                onClick={() => setTabActive(0)}
            >
                 Voltar para Tela de Inicio
            </button>
        </div>
    );
};
