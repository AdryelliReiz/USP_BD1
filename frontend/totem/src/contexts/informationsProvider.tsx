import React, { createContext, useState, ReactNode } from 'react';

interface InformationsContextProps {
    CPF: string;
    setCPF: (CPF: string) => void;
}

export const InformationsContext = createContext<InformationsContextProps>({} as InformationsContextProps);

interface InformationsProviderProps {
    children: ReactNode;
}

export const InformationsProvider: React.FC<InformationsProviderProps> = ({ children }) => {
    const [CPF, setCPF] = useState<string>('');
    return (
        <InformationsContext.Provider
            value={{
                CPF,
                setCPF
            }}
        >
            {children}
        </InformationsContext.Provider>
    );
};