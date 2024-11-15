import type { Metadata } from "next";
import "@/styles/globals.scss";
import { SessionProvider } from "@/context/sessionContext";
import SideBar from "@/components/SideBar";


export const metadata: Metadata = {
  title: "ADMIN | Dashboard",
  description: "Painel de controle do ADMIN",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
        <SessionProvider>
            <body>
                <SideBar />
                {children}
            </body>
        </SessionProvider>
    </html>
  );
}
