import { useNavigate } from 'react-router-dom';
import * as constants from "../jscode/constants";

export default function LogoutComponent() {

    localStorage.setItem(constants.token_isAuthenticated, false);
    localStorage.setItem(constants.token_string, constants.string_empty);
    localStorage.setItem(constants.token_userName, constants.string_empty);
    localStorage.setItem(constants.token_role, constants.string_empty);
    localStorage.setItem(constants.token_expTime, 0); 

    let navigate = useNavigate();
    let to = constants.page_home; 
    return navigate(to, { replace: true });
}

