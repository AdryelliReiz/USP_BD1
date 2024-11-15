'use client'
import { logout } from "@/app/actions/auth";
import { useSession } from "@/context/sessionContext";

export default function SideBar() {
    const { sessionUser } = useSession();
    return (
        <div className="sidebar-container">
            <p>{sessionUser?.name} | {sessionUser?.type}</p>
            <button onClick={logout} >Logout</button>
        </div>
    )
}