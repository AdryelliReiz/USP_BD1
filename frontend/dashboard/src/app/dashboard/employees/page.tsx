'use client';

import Table from "@/components/Table";
import { useSession } from "@/context/sessionContext";
import api from "@/services/api";
import Link from "next/link";
import { useEffect, useState } from "react";
import { BiPlus, BiSearch, BiTrash, BiEdit } from "react-icons/bi";
import {MdClose} from "react-icons/md";

type Employee = {
    cpf: string;
    nome: string;
    tipo_funcionario: string;
    cinema_vinculado: string;
    data_contratado: string;
    email_corporativo: string;
}

export default function EmployeesPage(){
    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [employeeSelected, setEmployeeSelected] = useState(NaN);
    const [employeesData, setEmployeesData] = useState<Employee[]>([]);

    const [searchName, setSearchName] = useState('');
    const [searchType, setSearchType] = useState('');
    const [searchCpf, setSearchCpf] = useState('');
    // dados do funcionário selecionado
    const [name, setName] = useState('');
    const [cinema, setCinema] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const { sessionUser } = useSession();

    function toggleModal(employeeIndex: number){

        if(!isNaN(employeeIndex)){
            setName(employeesData[employeeIndex].nome);
            setCinema(employeesData[employeeIndex].cinema_vinculado);
            if(employeesData[employeeIndex].tipo_funcionario === 'Administrador'){
                setEmail(employeesData[employeeIndex].email_corporativo || '');
                setPassword('');
            }
        }

        setEmployeeSelected(employeeIndex);
        setModalIsOpen(!modalIsOpen);
    }

    useEffect(() => {
        async function searchAllCinemas() {
            const { data, status } = await api.get('/admin/employees/?nome=&tipo=&cpf=', {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${sessionUser?.access_token}`
                }
            });

            if (status === 200){
                setEmployeesData(data);
            }
        }

        searchAllCinemas()
    },[sessionUser?.access_token]);

    async function searchEmployees(){
        const { data, status } = await api.get(`/admin/employees/?nome=${searchName}&tipo=${searchType}&cpf=${searchCpf}`, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${sessionUser?.access_token}`
            }
        });

        if (status === 200){
            setEmployeesData(data);
        }
    }
    
    return (
        <section>
            {sessionUser ? (
                <div className="dash-container">
                    <div className="dash-header">
                        <h2>Funcionários</h2>
                        <h3>Gerencie os dados dos nossos funcionários</h3>
                    </div>

                    <div className="dash-content">
                        <h4>Procurando algo em especifico</h4>
                        <div className="dash-actions">
                            <div className="search-container">
                                <input type="text" placeholder="Nome" value={searchName} onChange={(e) => setSearchName(e.target.value)} />
                                <input type="text" placeholder="CPF" value={searchCpf} onChange={(e) => setSearchCpf(e.target.value)} />
                                <select value={searchType} onChange={(e) => setSearchType(e.target.value)}>
                                    <option value="">Tipo</option>
                                    <option value="Comum">Funcionario Comum</option>
                                    <option value="admin">Administrador</option>
                                    <option value="Gerente">Gerente</option>
                                </select>
                                <button onClick={searchEmployees} className="search-btn" >
                                    Buscar
                                    <BiSearch size={20} />
                                </button>
                            </div>
                            
                            <Link href="/dashboard/employees/new">
                                <button className="add-btn">
                                    <BiPlus size={20} />
                                </button>
                            </Link>
                        </div>

                        <Table
                            columns={['Nome', 'CPF', 'Tipo', 'Trabalha em', 'Data de contrato', 'Email corporativo ','Ações']}
                            data={employeesData.map((employee, index) => [
                                employee.nome,
                                employee.cpf,
                                employee.tipo_funcionario,
                                employee.cinema_vinculado,
                                employee.data_contratado,
                                employee.email_corporativo,
                                
                                <div key={employee.cpf} className="td-actions" >
                                    <button key="edit" onClick={() => toggleModal(index)}>
                                        <BiEdit size={18} />
                                    </button>
                                    <button key="delete">
                                        <BiTrash size={18} />
                                    </button>
                                </div>
                                
                            ])}
                        />
                    </div>

                    {modalIsOpen && (
                        <div className="modal">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <div>
                                        <h3>Editar dados de um {employeesData[employeeSelected].tipo_funcionario}</h3>
                                    </div>

                                    <button onClick={() => toggleModal(NaN)} >
                                        <MdClose size={18} />
                                    </button>
                                </div>

                                <div className="modal-body">
                                    <form action="">
                                        <div className="input-group">
                                            <label htmlFor="nome">Nome</label>
                                            <input type="text" id="nome" value={name} onChange={(e) => setName(e.target.value)}/>
                                        </div>

                                        {employeesData[employeeSelected].tipo_funcionario === 'Funcionario Comum' && (
                                            <div className="input-group">
                                                <label htmlFor="cinema">Ciname</label>
                                                <select id="gerente" value={cinema} onChange={(e) => setCinema(e.target.value)}>
                                                    <option value={employeesData[employeeSelected].cinema_vinculado} disabled>
                                                        {employeesData[employeeSelected].cinema_vinculado} (Gerente atual)
                                                    </option>
                                                    <option value="Cinemark">Cinemark</option>
                                                    <option value="Cinepolis">Cinepolis</option>
                                                    <option value="UCI">UCI</option>
                                                </select>
                                            </div>
                                        )}

                                        {(employeesData[employeeSelected].tipo_funcionario === 'Administrador' ||
                                        employeesData[employeeSelected].tipo_funcionario === 'Gerente')  && (
                                            <>
                                                <div className="input-group">
                                                    <label htmlFor="email">Email corporativo</label>
                                                    <input type="email" id="email" value={email} onChange={(e) => setEmail(e.target.value)}/>
                                                </div>

                                                <div className="input-group">
                                                    <label htmlFor="password">Senha</label>
                                                    <input type="password" id="password" value={password} onChange={(e) => setPassword(e.target.value)}/>
                                                </div>
                                            </>
                                        )}
                                        
                                    </form>
                                    
                                    <div className="modal-actions">
                                        <button onClick={() => toggleModal(NaN)}>Fechar</button>
                                        <button>Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>
            ) : (
                null
            )}
        </section>
    )
}