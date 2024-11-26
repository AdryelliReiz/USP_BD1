'use client'
import { logout } from "@/app/actions/auth";
import { BiLogOut } from "react-icons/bi";

import './styles.scss';

export default function SideBar() {
    return (
        <div className="sidebar-container">
            <button onClick={logout} >
                <BiLogOut size={24} />
            </button>
        </div>
    )
}