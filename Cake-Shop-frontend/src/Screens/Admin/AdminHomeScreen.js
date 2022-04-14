
import { useSelector } from "react-redux";
import Header from "../../Components/Header";
import AddProduct from "../../Images/AddProduct.jpg"
import {toast} from "react-toastify"
import axios from 'axios'
import { URL_PATH } from '../../Constants/Url'
import React, { useEffect, useState } from 'react'
const AdminHomeScreen = (props) => {
  const userSignIn = useSelector((store) => store.userSignIn);
  const url_fetch_orders = URL_PATH+"/order/all"
    const url_assign_order = URL_PATH+"/order/update"
    const url_image = URL_PATH+"/product/image"

    const role = useSelector(store=>store.userSignIn.response.data.role)

    const header = {
        headers:{
            "Content-Type" : "application/json",
            "Authorization": sessionStorage.getItem("Authorization")
        }
    }

    const [orders, setOrders] = useState([])
    const [isAssigned,setIsAssigned] = useState(false)
    
    useEffect(()=>{
        axios.get(url_fetch_orders, header)
        .then(response => {
            setOrders([])
            setIsAssigned(false)
            if(role==="ADMIN"){
                setOrders(response.data.data.filter(item => item.order.orderStatus==="PLACED"))
            }
            else if(role==="DELIVERY_PERSON"){
                setOrders(response.data.data.filter(item => item.order.orderStatus==="READY"))
            }
        })
        .catch(error=>{
            toast.error(error.message,{autoClose:2000,position:toast.POSITION.TOP_RIGHT})
        })
    }, [isAssigned])

    const onAssign = (orderId) => {
        axios.patch(url_assign_order,{orderId},header)
        .then(response => {
            toast.success(response.data.data,{position:toast.POSITION.TOP_RIGHT,autoClose:2000})
            setIsAssigned(true)
        })
        .catch(error => {
            toast.error(error.message,{autoClose:2000,position:toast.POSITION.TOP_RIGHT})
        })
    }

  return (
    <div className="Screen" >
      {!userSignIn.response && <Header title="You are not logged in" />}
      {userSignIn.response && (
        <Header title={"Welcome " + userSignIn.response.data.firstName} />
      )}

<Header title="All Orders" />
            <div className="row">
                <div className="col-md-2"></div>
                <div className="col-md-8">
                {
                    orders.length>0 &&
                    orders.map( orderInfo => {
                        return(
                            <div className="order-area">
                                <div className=" order-top  ">
                                    <div className="row text-center ">
                                        <div className="col-md-3"> <strong> Order Date </strong> <br/> {orderInfo.order.orderDate.split("T")[0]} | {orderInfo.order.orderDate.split("T")[1].split(".")[0]}</div>
                                        <div className="col-md-6"> <strong> Address </strong> <br/> {orderInfo.order.deliveryAddress.addressLine2}</div>
                                        <div className="col-md-3"><strong>Quantity</strong></div>
                                    </div>
                                </div>
                                <div className="order-details">
                                    {
                                        orderInfo.orderDetails.map(detail => {
                                            return (
                                                <div className="row">
                                                    <div className="col-md-4">                       
                                                        <div className="order-image text-center">
                                                            <span className="vertical-aligner"></span>
                                                            {
                                                                detail.selectedProduct.imageName &&
                                                                <img src={detail.selectedProduct.imageName} alt="product" className="img-fluid img-thumbnail"/>
                                                            }
                                                            {
                                                                !detail.selectedProduct.imageName &&
                                                                <img src={AddProduct} alt="product" className="img-fluid img-thumbnail"/>
                                                            }
                                                        </div>
                                                    </div>

                                                    <div className="col-md-6">
                                                        <br/>
                                                        <h5> {detail.selectedProduct.name} </h5>
                                                        <p> {detail.selectedProduct.description} </p>
                                                    </div>

                                                    <div className="col-md-2">
                                                        <br/><br/>
                                                        <h6>{detail.quantity} </h6>
                                                    </div>

                                                </div>
                                            )
                                        })
                                    }
                                </div>
                                <br/>
                            </div>   
                        )
                    })
                }   
                {
                    !orders.length>0 &&
                    <h5 className="text-center"><br/>No Orders Found.</h5>
                }
                </div>
                <div className="col-md-2"></div>
            </div>
    </div>
  );
};

export default AdminHomeScreen;
