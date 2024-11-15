import { redirect } from 'next/navigation'
import { deleteSession } from '@/app/lib/session'
import { createSession } from '@/app/lib/session'
import { SignupFormSchema, FormState } from '@/app/lib/definitions'
//import api from '@/services/api'
 
export async function logout() {
    await deleteSession()
    redirect('/login')
}

export async function signup(state: FormState, formData: FormData) {
    // Valide os campos do formulário
    const validatedFields = SignupFormSchema.safeParse({
        email: formData.get('email'),
        password: formData.get('password'),
    })
    
    // Se algum campo não for válido, retorne os erros
    if (!validatedFields.success) {
        console.log(validatedFields.error.flatten().fieldErrors)
        return {
        errors: validatedFields.error.flatten().fieldErrors,
        }
    }

    //const { email, password } = validatedFields.data

    // Envie os dados do formulário para a API
    /*const response = await api.post('/login', { email, password });

    // Se a API retornar um erro, retorne a mensagem de erro
    if (response.status !== 200) {
        return {
            message: response.data.message,
        }
    }*/

    const response = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQWRyeSBBRE0iLCJ0eXBlIjoiZ2VyZW50ZSIsInVzZXJJZCI6IjExMTEifQ.emMJGkst4zUBuLvJupr2DUokn_D1ueJ0-7j_PTAAZes"
    // esse response é o token de acesso do Admin
    //const response = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiQWRyeSBBRE0iLCJ0eXBlIjoiYWRtaW4iLCJ1c2VySWQiOiIxMTExIn0.TsFZ_RQvDX_xEw5Ph8jVVzNDl3Aezw-WW_9JTsbyNTs"
    const access_token = response//response.data.access_token;

    await createSession(access_token)
    redirect('/dashboard')
}