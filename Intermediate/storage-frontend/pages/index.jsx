// import required modules
// the essential modules to interact with frontend are below imported.
// ethers is the core module that makes RPC calls using any wallet provider like Metamask which is esssential to interact with Smart Contract
import { ethers } from "ethers";

import { ConnectButton } from '@rainbow-me/rainbowkit';
// react hooks for setting and changing states of variables
import { useEffect, useState } from 'react';
import { useProvider, useAccount, useContractRead } from 'wagmi'
import { useContractWrite, usePrepareContractWrite , useWaitForTransaction} from 'wagmi'

export default function Home() {
  // env variables are initalised
  // contractAddress is deployed smart contract addressed 
  const contractAddress = process.env.CONTRACT_ADDRESS;
  // application binary interface is something that defines structure of smart contract deployed.
  const abi = process.env.ABI


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
    watch:true,
  })

  function handleForm(e) {
    setEnteredNumber(e.target.value)
  }


  async function readNumber() {
    setStoredNumber(parseInt(data))
    console.log(parseInt(data))
  }


  const { config } = usePrepareContractWrite({
    address: contractAddress,
    abi: abi,
    functionName: 'writeNum',
    args: [enteredNumber]
  })
  const { data: writeNumFunc, isLoading: writeNumLoading, isSuccess, write } = useContractWrite({
    ...config,
    
    onSuccess(data) {
      console.log('Success', data)
    },
  })
  const waitForTransaction = useWaitForTransaction({
    hash: writeNumFunc?.hash,
  })

  async function writeNumber() {
    await write();
    console.log(writeNumFunc)
    console.log(waitForTransaction)
  }

  useEffect(()=>{
    readNumber()
      console.log("Wait for transaction "+ waitForTransaction)
      console.log("Use Contract Write for transaction "+ useContractWrite)
      console.log("Use Contract Read for transaction "+ useContractRead)
  }, [waitForTransaction , useContractWrite , useContractRead])


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
      <h3>This will do Write function</h3>
      <input type="text" value={enteredNumber} onChange={handleForm} />
      <br />
        <button className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" disabled={!write} onClick={writeNumber}>
          Write
        </button>
        {writeNumLoading && <div>Check Wallet</div>}
        {waitForTransaction.isLoading && <div>Transacting ..... </div>}
    </div>
  )
}