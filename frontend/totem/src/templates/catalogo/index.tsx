import { useContext, useEffect, useState } from "react";
import { InformationsContext } from "../../contexts/informationsProvider"; 
import "./styles.scss";
import api from "../../services/api";
import formatarData from "../../utils/formatarData";
import formatarHora from "../../utils/formatarHora";

type sessionsMovieData = {
  date: string;
  film_id: number;
  titulo: string;
  ano: number;
  diretor: string;
  class_ind: number;
  idioma: string;
  duracao: string;
  eh_dub: boolean;
  fim_contrato: string;
  descricao: string;
  sessions: string[];
}

const Cinema: React.FC = () => {
  const { tabActive, setTabActive, dateSelected, setDateSelected, selectedCinema, setSelectedMovie, setSelectedMovieName } = useContext(InformationsContext);
  const [sessions, setSessions] = useState<sessionsMovieData[]>([]);
  const [dates, setDates] = useState<string[]>([]);
  const [films, setFilms] = useState<sessionsMovieData[]>([]);

  useEffect(() => {
    //totem/cinemas/
    async function fetchCinemas() {
      const {data} = await api.get(`/totem/movies/${selectedCinema}/`);

      setSessions(data);
      //remove duplicates
      setDates(Array.from(new Set([...dates, ...data.map((item: sessionsMovieData) => item.date)])));

      setDateSelected(data[0].date);

      console.log(data)
    }

    fetchCinemas()
  }, [])

  useEffect(() => {
    setFilms(sessions.filter((item: sessionsMovieData) => item.date === dateSelected));
  }, [dateSelected])

  return (
    <div className="cinema-container">
      <h1 className="cinema-title">CINEACH</h1>
      <p className="cinema-subtitle">Filmes em cartaz</p>
      <div className="date-tabs">
        {dates.map((date, index) => (
          <button 
            className={`${date == dateSelected && "active-tab"}`}
            key={index}
            onClick={() => {
              console.log(date)
              setDateSelected(date)}
            }
            >
              {formatarData(date)}
          </button>
        ))}
      </div>
      <div className="films-container">
        {films.map((film, index) => (
          <div className="film-card" key={index}>
            <button
              onClick={() => (
                setSelectedMovieName(film.titulo),
                setSelectedMovie(film.film_id),
                setTabActive(tabActive + 1)
              )}
              className="film-poster-button"
            >
              <img src="https://sm.ign.com/t/ign_br/screenshot/s/spider-man/spider-man-2002-poster-tobey-maguire-as-spider-man_nbcp.600.jpg" alt={film.titulo} className="film-poster" />
            </button>
            <p className="film-title">{film.titulo}</p>
            <div className="film-times">
              {film.sessions.map((time, idx) => (
                <span key={idx} className="film-time">
                  {formatarHora(time)}
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
