import axios from 'axios';

export async function updateData(data, apiPath){
    await axios.post(apiPath, data)
        .then(res => {
            return res.data;
        })
        .catch(error => {
            console.log("Error: ", error);
        });
}