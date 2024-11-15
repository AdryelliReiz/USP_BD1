'use client';

import { useSession } from "@/context/sessionContext";

export default function DashboardHome(){
    const { sessionUser } = useSession();
    
    return (
        <div className="dash-container">
            {sessionUser ? (
                <h1>Welcome, {sessionUser.name}!</h1>
            ) : (
                <h1>Not logged in</h1>
            )}
        </div>
    )
}