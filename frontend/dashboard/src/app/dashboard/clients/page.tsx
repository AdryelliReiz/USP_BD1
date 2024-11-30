'use client';

import Table from "@/components/Table";
import { useSession } from "@/context/sessionContext";
import api from "@/services/api";
import { useEffect, useState } from "react";
import { BiSearch, BiTrash } from "react-icons/bi";

type ClientData = {
    nome: string;
    sobrenome: string;
    cpf: string;
    email: string;
    telefone: number;
    rua: string;
    n_end: number;
    complemento: string | null;
    saldo_pontos: number;
}

export default function ClientsPage(){
    const { sessionUser } = useSession();

    const [clientsData, setClientsData] = useState<ClientData[]>([]);

    const [searchName, setSearchName] = useState('');
    const [searchLastName, setSearchLastName] = useState('');
    const [searchCpf, setSearchCpf] = useState('');
    const [searchEmail, setSearchEmail] = useState('');
    const [searchAddress, setSearchAddress] = useState('');
    

    useEffect(() => {
        async function searchAllCinemas() {
            const { data, status } = await api.get('/admin/clients/?nome_cliente=&sobrenome_cliente=&cpf_cliente=&email_cliente&rua_cliente=', {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${sessionUser?.access_token}`
                }
            });

            if (status === 200){
                setClientsData(data);
            }
        }

        searchAllCinemas()
    },[sessionUser?.access_token]);

    async function searchClients(){
        const { data, status } = await api.get(`/admin/clients/?nome_cliente=${searchName}&sobrenome_cliente=${searchLastName}&cpf_cliente=${searchCpf}&email_cliente=${searchEmail}&rua_cliente=${searchAddress}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${sessionUser?.access_token}`
            }
        });

        if (status === 200){
            setClientsData(data);
        }
    }
    
    return (
        <section>
            {sessionUser ? (
                <div className="dash-container">
                    <div className="dash-header">
                        <h2>Clientes</h2>
                        <h3>Busque por informações dos nossos clientes</h3>
                    </div>

                    <div className="dash-content">
                        <h4>Procurando algo em especifico</h4>
                        <div className="dash-actions">
                            <div className="search-container">
                                <input type="text" placeholder="Nome" onChange={(e) => setSearchName(e.target.value)} />
                                <input type="text" placeholder="Sobrenome" onChange={(e) => setSearchLastName(e.target.value)} />
                                <input type="text" placeholder="CPF" onChange={(e) => setSearchCpf(e.target.value)} />
                                <input type="text" placeholder="E-mail" onChange={(e) => setSearchEmail(e.target.value)} />
                                <input type="text" placeholder="Endereço" onChange={(e) => setSearchAddress(e.target.value)} />
                                <button onClick={searchClients} className="search-btn" >
                                    <BiSearch size={20} />
                                </button>
                            </div>
                        </div>

                        <Table
                            columns={['Nome', 'CPF', 'E-mail', 'Telefone', 'Endereço', 'Saldo de Pontos', 'Ações']}
                            data={clientsData.map((employee) => [
                                employee.nome,
                                employee.cpf,
                                employee.email,
                                employee.telefone,
                                (employee.rua + ', ' + employee.n_end + (employee.complemento ? ', ' + employee.complemento : '')),
                                employee.saldo_pontos,
                                
                                <div key={employee.cpf} className="td-actions" >
                                    <button key="delete">
                                        <BiTrash size={18} />
                                    </button>
                                </div>
                                
                            ])}
                        />
                    </div>
                </div>
            ) : (
                null
            )}
        </section>
    )
}