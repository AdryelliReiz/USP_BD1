'use client'
import { useFormState, useFormStatus } from 'react-dom'
import { signup } from '@/app/actions/auth'

export default function Login() {
    const [state, action] = useFormState(signup, undefined)
    const { pending } = useFormStatus()

    return (
        <main>
            <div className="login-container">
                <h1>CINEACH | DASHBOARD</h1>
                
                <div className="form-container">
                    <form action={action}>
                        <div>
                            <label htmlFor="email">E-mail</label>
                            <input id="email" name="email" placeholder="Email" />
                        </div>
                        {state?.errors?.email && <p>{state.errors.email}</p>}
                    
                        <div>
                            <label htmlFor="password">Senha</label>
                            <input id="password" name="password" type="password" />
                        </div>
                        {state?.errors?.password && (
                            <div>
                            <p>Password must:</p>
                            <ul>
                                {state.errors.password.map((error) => (
                                <li key={error}>- {error}</li>
                                ))}
                            </ul>
                            </div>
                        )}
                        <button disabled={pending} type="submit">
                            Entrar
                        </button>
                    </form>
                </div>
            </div>
        </main>
    );
}
