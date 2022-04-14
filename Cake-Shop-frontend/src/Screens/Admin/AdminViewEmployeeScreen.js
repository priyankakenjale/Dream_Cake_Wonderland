/* eslint-disable react-hooks/exhaustive-deps */
import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { useSelector } from 'react-redux'
import Header from '../../Components/Header'
import {toast} from "react-toastify"
import { URL_PATH } from '../../Constants/Url'

const AdminViewEmployeeScreen = (props) => {

    const userSignIn = useSelector(store => store.userSignIn)
    const url_employee = URL_PATH+"/user/employees"
    const url_delivery = URL_PATH+"/user/delivery_persons"
    
    const header = {
        headers: {
          "Content-Type": "application/json",
          "Authorization" : sessionStorage.getItem("Authorization")
        },
    };

    const [employeeList,setEmployeeList] = useState([])
    const [deliveryList,setDeliveryList] = useState([])
    
    useEffect(()=>{
        axios.get(url_employee,header)
        .then((response)=>{
            setEmployeeList(response.data.data)
        })
        .catch((error)=>{
            toast.error(error.message,{autoClose:2000,position:toast.POSITION.TOP_RIGHT})
        })

        axios.get(url_delivery,header)
        .then((response)=>{
            setDeliveryList(response.data.data)
        })
        .catch((error)=>{
            toast.error(error.message,{autoClose:2000,position:toast.POSITION.TOP_RIGHT})
        })
    },[])

    return (
        <div className="Screen">
            {
                !userSignIn.response &&
                    <Header title="You are not logged in"/>
            }
            {
                userSignIn.response &&
                <div>
                    <Header title="All Employees"/>
                    <br/>
                    <div className="row">
                    <div className="col-md-6 Block">
                        <h6 className="text-center h5">View Cakeshops</h6>
                        <hr/>
                        <br/>
                        <table className="table table-striped table-bordered table-hover">
                           
                            <thead className="table-light">
                            <tr>
                               <th >Cakeshop Name</th>
                               <th className="text-center">Cakeshop Email</th>
                               <th className="text-center">Cakeshop Phone</th>
                               </tr>
                            </thead>
                            <tbody>
                                {
                                    employeeList && employeeList.map( employee=>{
                                        return (
                                            
                                            <tr>
                                                
                                                <td className="text-left"> {employee.firstName} </td>
                                                <td className="text-left"> {employee.email} </td>
                                                <td className="text-left"> {employee.phone || "Not Provided"} </td>
                                            </tr>    
                                        )
                                    })
                                }
                            </tbody>
                        </table>
                    </div>
                    <div className="col-md-6">
                        <h6 className="text-center h5">View Deliverers</h6>
                        <hr/>
                        <br/>
                        <table className="table table-striped table-bordered table-hover">
                        <thead className="table-light">
                            <tr>
                               <th className="text-center">Delivery-Boy Name</th>
                               <th className="text-center">Delivery-Boy Email</th>
                               <th className="text-center"
                               >Delivery-Boy Phone</th>
                               </tr>
                            </thead>
                            <tbody>
                                {
                                    deliveryList && deliveryList.map( delivery=>{
                                        return (
                                            <tr>
                                                
                                                <td className="text-left"> {delivery.firstName} </td>
                                                <td className="text-left"> {delivery.email} </td>
                                                <td className="text-left"> {delivery.phone || "Not Provided"} </td>
                                            </tr>    
                                        )
                                    })
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            }
        </div>
    )
}

export default AdminViewEmployeeScreen