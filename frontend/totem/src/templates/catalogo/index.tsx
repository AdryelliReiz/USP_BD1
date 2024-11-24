import { useContext } from "react";
import { InformationsContext } from "../../contexts/informationsProvider" // Certifique-se de importar corretamente o contexto
import "./styles.scss";

interface Film {
  title: string;
  image: string;
  times: string[];
}

const Cinema: React.FC = () => {
  const { tabActive, setTabActive } = useContext(InformationsContext);

  const films: Film[] = [
    {
      title: "Deadpool & Wolverine",
      image: "/imagens/deadpool.png", // Substituir pelo caminho correto
      times: ["13:30", "19:40", "20:20"],
    },
    {
      title: "Divertidamente 2",
      image: "/imagens/divertidamente.png", // Substituir pelo caminho correto
      times: ["11:45", "14:50"],
    },
    {
      title: "Homem-Aranha Através do Aranhaverso",
      image: "/imagens/spider.png", // Substituir pelo caminho correto
      times: ["16:00", "17:30", "19:30"],
    },
  ];

  return (
    <div className="cinema-container">
      <h1 className="cinema-title">CINEACH</h1>
      <p className="cinema-subtitle">Filmes em cartaz</p>
      <div className="date-tabs">
        <button className="active-tab">Hoje</button>
        <button>30/10</button>
        <button>31/10</button>
        <button>01/11</button>
        <button>02/11</button>
      </div>
      <div className="films-container">
        {films.map((film, index) => (
          <div className="film-card" key={index}>
            <button
              onClick={() => setTabActive(tabActive + 1)}
              className="film-poster-button"
            >
              <img src={film.image} alt={film.title} className="film-poster" />
            </button>
            <p className="film-title">{film.title}</p>
            <div className="film-times">
              {film.times.map((time, idx) => (
                <span key={idx} className="film-time">
                  {time}
                </span>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Cinema;
