import React, { createContext, useState, ReactNode } from 'react';

interface InformationsContextProps {
    tabActive: number;
    setTabActive: (tabActive: number) => void;
    CPF: string;
    setCPF: (CPF: string) => void;
}

export const InformationsContext = createContext<InformationsContextProps>({} as InformationsContextProps);

interface InformationsProviderProps {
    children: ReactNode;
}

export const InformationsProvider: React.FC<InformationsProviderProps> = ({ children }) => {
    const [tabActive, setTabActive] = useState(0);
    const [CPF, setCPF] = useState<string>('');
    return (
        <InformationsContext.Provider
            value={{
                tabActive,
                setTabActive,
                CPF,
                setCPF
            }}
        >
            {children}
        </InformationsContext.Provider>
    );
};