'use client'

import ReportCard from "@/components/ReportCard";
import { useSession } from "@/context/sessionContext";
import api from "@/services/api";
import { useEffect, useState } from "react";
import { Bar, BarChart, CartesianGrid, Legend, Pie, PieChart, ResponsiveContainer, Sector, Tooltip, XAxis, YAxis } from "recharts";

type ReportResponse = {
    faturamento_mes_anterior: number | null;
    faturamento_mes_atual: number;
    faturamento_por_cinema: {
        cnpj: string;
        nome: string;
        faturamento: number;
    }[];
    ingressos_mais_vendidos: {
        tipo_ingresso: string;
        vendidos: number;
    }[];
    filmes_mais_vendidos: {
        titulo: string;
        genero: string | null;
        faturamento: number;
        sessoes_exibidas: number;
        aproveitamento: number | null;
    }[];
};

export default function ReportsPage() {
    const { sessionUser } = useSession();
    const [activeIndex, setActiveIndex] = useState(0);
    const [reports, setReports] = useState<ReportResponse | null>(null);
    
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    function onPieEnter(_: any, index: number) {
        setActiveIndex(index);
    };

    useEffect(() => {
        async function searchAllCinemas() {
            const { data, status } = await api.get('/admin/reports/', {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${sessionUser?.access_token}`
                }
            });

            if (status === 200){
                setReports(data);
                console.log(data)
            }
        }

        searchAllCinemas()
    },[sessionUser?.access_token]);

    return (
        <section>
            {sessionUser && reports ? (
                <div className="dash-container">
                    <div className="dash-header">
                        <h2>Relatórios</h2>
                    </div>

                    <div className="dash-content">
                        <div className="reports-container">
                            <div className="reports-grid grid-3">
                                <ReportCard 
                                    title="Faturamento do mês anterior" 
                                    content={
                                        <p><strong>R$ {(reports?.faturamento_mes_anterior ?? 0).toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</strong></p>
                                    }
                                />

                                <ReportCard 
                                    title="Faturamento do mês atual" 
                                    content={
                                        <p><strong>R$ {reports?.faturamento_mes_atual.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</strong></p>
                                    }
                                />

                            </div>

                            <div className="reports-grid grid-2 charts-container">
                                <ReportCard 
                                    title="Faturamento dos cinemas" 
                                    content={
                                        <ResponsiveContainer width="100%" height="100%">
                                            <BarChart
                                            width={400}
                                            height={200}
                                            data={reports?.faturamento_por_cinema}
                                            margin={{
                                                top: 20,
                                                right: 30,
                                                left: 20,
                                                bottom: 5,
                                            }}
                                            >
                                                <CartesianGrid />
                                                <XAxis dataKey="name" />
                                                <YAxis />
                                                <Tooltip />
                                                <Legend />
                                                <Bar dataKey="Faturamento" stackId="billing" fill="#811FA9" />
                                            </BarChart>
                                        </ResponsiveContainer>
                                    }
                                />

                                <ReportCard
                                    title="Ingressos mais vendidos"
                                    content={
                                        <ResponsiveContainer width="100%" height="100%">
                                            <PieChart width={400} height={400}>
                                            <Pie
                                                activeIndex={activeIndex}
                                                activeShape={renderActiveShape}
                                                data={reports?.ingressos_mais_vendidos}
                                                cx="50%"
                                                cy="50%"
                                                innerRadius={60}
                                                outerRadius={80}
                                                fill="#811FA9"
                                                dataKey="value"
                                                onMouseEnter={onPieEnter}
                                            />
                                            </PieChart>
                                        </ResponsiveContainer>
                                    }
                                />
                            </div>

                            <div className="reports-grid grid-1">
                                <ReportCard
                                    title="Filmes mais vendidos"
                                    content={
                                        <table className="movie-table">
                                            <thead>
                                                <tr>
                                                    <th>Título</th>
                                                    <th>Aproveitamento</th>
                                                    <th>Gênero</th>
                                                    <th>Faturamento</th>
                                                    <th>Sessões Exibidas</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {reports?.filmes_mais_vendidos.map((movie, index) => (
                                                    <tr key={index}>
                                                    <td>{movie.titulo}</td>
                                                    <td>{movie.aproveitamento ? movie.aproveitamento.toFixed(2) : 'N/A'}%</td>
                                                    <td>{movie.genero}</td>
                                                    <td>{movie.faturamento ? movie.faturamento.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) : '0,00'}</td>
                                                    <td>{movie.sessoes_exibidas}</td>
                                                </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    }
                                />
                            </div>
                        </div>
                    </div>
                </div>
            ) : null}
        </section>
    );
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const renderActiveShape = (props: any) => {
    const RADIAN = Math.PI / 180;
    const { cx, cy, midAngle, innerRadius, outerRadius, startAngle, endAngle, fill, payload, percent, value } = props;
    const sin = Math.sin(-RADIAN * midAngle);
    const cos = Math.cos(-RADIAN * midAngle);
    const sx = cx + (outerRadius + 10) * cos;
    const sy = cy + (outerRadius + 10) * sin;
    const mx = cx + (outerRadius + 30) * cos;
    const my = cy + (outerRadius + 30) * sin;
    const ex = mx + (cos >= 0 ? 1 : -1) * 22;
    const ey = my;
    const textAnchor = cos >= 0 ? 'start' : 'end';
  
    return (
        <g>
            <text x={cx} y={cy} dy={8} textAnchor="middle" fill={fill}>
                {payload.name}
            </text>
            <Sector
                cx={cx}
                cy={cy}
                innerRadius={innerRadius}
                outerRadius={outerRadius}
                startAngle={startAngle}
                endAngle={endAngle}
                fill={fill}
            />
            <Sector
                cx={cx}
                cy={cy}
                startAngle={startAngle}
                endAngle={endAngle}
                innerRadius={outerRadius + 6}
                outerRadius={outerRadius + 10}
                fill={fill}
            />
            <path d={`M${sx},${sy}L${mx},${my}L${ex},${ey}`} stroke={fill} fill="none" />
            <circle cx={ex} cy={ey} r={2} fill={fill} stroke="none" />
            <text x={ex + (cos >= 0 ? 1 : -1) * 12} y={ey} textAnchor={textAnchor} fill="#333">{`${value} ingressos`}</text>
            <text x={ex + (cos >= 0 ? 1 : -1) * 12} y={ey} dy={18} textAnchor={textAnchor} fill="#999">
                {`${(percent * 100).toFixed(2)}%`}
            </text>
        </g>
    );
};