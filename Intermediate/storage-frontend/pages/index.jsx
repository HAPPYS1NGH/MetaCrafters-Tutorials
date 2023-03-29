// import required modules
// the essential modules to interact with frontend are below imported.
// ethers is the core module that makes RPC calls using any wallet provider like Metamask which is esssential to interact with Smart Contract
import { ethers } from "ethers";

import { ConnectButton } from '@rainbow-me/rainbowkit';
// react hooks for setting and changing states of variables
import { useEffect, useState } from 'react';
import {useProvider , useAccount , useContractRead} from 'wagmi'

export default function Home() {
  // env variables are initalised
  // contractAddress is deployed smart contract addressed 
  const contractAddress = process.env.CONTRACT_ADDRESS;
  // application binary interface is something that defines structure of smart contract deployed.
  const abi = process.env.ABI;

  
  // response from read operation is stored in the below variable
  const [storedNumber, setStoredNumber] = useState();

  // the value entered in the input field is stored in the below variable
  const [enteredNumber, setEnteredNumber] = useState(0);
  const provider = useProvider();
  const signer = useAccount();
  const { data, isError, isLoading } = useContractRead({
    address: contractAddress,
    abi: abi,
    functionName: 'readNum',
    onSuccess(data) {
      console.log('Success', data)
    },
    onError(error) {
      console.log('Error', error)
    },
  })
  
  
  async function readNumber(){
    // eslint-disable-next-line react-hooks/rules-of-hooks
    setStoredNumber(parseInt(data))
  console.log(parseInt(data))
  }
  
  async function writeNumber(){
    try {
      const smartContract = new ethers.Contract(contractAddress, abi, provider);
      const contractWithSigner = smartContract.connect(signer);

      // interact with the methods in smart contract as it's a write operation, we need to invoke the transation usinf .wait()
      const writeNumTX = await contractWithSigner.writeNum(enteredNumber);
      const response = await writeNumTX.wait()
      console.log(await response)

      alert(`Number stored successfully ${enteredNumber}`)   
      return

    } catch (error) {
      alert(error)
      setStoreLoader(false)
      return
    }
  }
  

  return (
    <div className='m-6 space-y-4'>
      <div className="flex p-4">
      <h1 className="text-gray-700 text-3xl font-bold">
        Storage Frontend Demo
      </h1>
      <div className="ml-auto">
      <ConnectButton />
      </div>
      </div>

      <h3>This action retrieves the saved number from smart contract. (i.e Read Operation)</h3>
      <button onClick={readNumber}>ReadNumber : {storedNumber}</button>
      </div>
  )
}