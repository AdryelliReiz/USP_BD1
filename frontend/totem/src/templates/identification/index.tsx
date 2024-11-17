import  { useContext, useState } from "react";
import "./styles.scss";
import { InformationsContext } from "../../contexts/informationsProvider"

export default function Identification() {

    const {tabActive, setTabActive} = useContext(InformationsContext);
    const [cpf, setCpf] = useState("");

  const handleButtonClick = (value: string) => {
    if (value === "<") {
      setCpf(cpf.slice(0, -1)); // Remove o último caractere
    } else {
      setCpf(cpf + value); // Adiciona o número clicado
    }
  };

  
  return (
    <div className="identification-container" >
            <div className="c-content">
                    <h1>CINEACH</h1>
                </div>

                <div className = "c-title">
                    <h2>Se Identifique</h2>
                </div>

        <div className="cpf-input-container">
        <input
          type="text"
          value={cpf}
          placeholder="Digite seu CPF"
          readOnly
        />
      </div>

      <button onClick={() => setTabActive(tabActive + 1)}>
        Não Quero me Identificar
      </button>

      <button onClick ={() => setTabActive(tabActive - 1)}>Voltar 
      </button> 

      <div className="keypad">
        {[1, 2, 3, 4, 5, 6, 7, 8, 9, "<", 0].map((key) => (
          <button
            key={key}
            className="keypad-button"
            onClick={() => handleButtonClick(key.toString())}
          >
            {key}
          </button>
        ))}
      </div>
    </div>
  );
}
