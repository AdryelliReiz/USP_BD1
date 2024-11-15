import { NextRequest, NextResponse } from 'next/server';
import { jwtVerify } from 'jose';

export type ISession = {
    userId: string;
    name: string;
    type: 'admin' | 'gerente';
};

// Rotas protegidas e específicas
const protectedRoutes = ['/dashboard'];
const gerenteAllowedRoutes = ['/dashboard/cinema']; // Rotas permitidas para gerente

export default async function middleware(req: NextRequest) {
    const path = req.nextUrl.pathname;

    // Verificar se a rota é protegida
    const isProtectedRoute = protectedRoutes.some((route) => path.startsWith(route));

    // Obter o token de acesso
    const access_token = req.cookies.get('session')?.value;

    // Caso não haja token, redirecionar para login em rotas protegidas
    if (!access_token) {
        if (isProtectedRoute) {
            return NextResponse.redirect(new URL('/login', req.nextUrl));
        }
        return NextResponse.next();
    }

    // Verificar o token
    const secretKey = new TextEncoder().encode('palavra-secreta');
    let session: ISession;
    try {
        const { payload } = await jwtVerify(access_token, secretKey);
        session = payload as ISession;
    } catch (error) {
        console.log(error);
        // Token inválido ou expirado
        if (isProtectedRoute) {
            return NextResponse.redirect(new URL('/login', req.nextUrl));
        }
        return NextResponse.next();
    }

    // Controle de acesso para admins
    if (session.type === 'admin') {
        return NextResponse.next(); // Admins têm acesso irrestrito
    }

    // Controle de acesso para gerentes
    if (session.type === 'gerente') {
        const isAllowedForGerente = gerenteAllowedRoutes.some((route) =>
            path.startsWith(route)
        );
        if (!isAllowedForGerente) {
            return NextResponse.redirect(new URL('/dashboard/cinema', req.nextUrl));
        }
        return NextResponse.next();
    }

    // Caso o tipo de usuário não seja reconhecido
    if (isProtectedRoute) {
        return NextResponse.redirect(new URL('/login', req.nextUrl));
    }

    return NextResponse.next();
}

// Configuração do middleware
export const config = {
    matcher: ['/((?!api|_next/static|_next/image|.*\\.png$).*)'],
};
