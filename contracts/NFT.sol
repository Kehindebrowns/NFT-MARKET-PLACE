//SPDX-Lisensce-Identifier:MIT
pragma solidity ^0.8.19;

 import "@openzepplin/contracts/token.ERC721/ERC721.sol";
 import "@openzepplin/contract/access/Ownable.sol";
 

contract NFT is  ("ERC20,Ownable") {
    uint256 payable nextTokenID;

    constructor() ERC20("MyNFT","MNFT"){
    nextTokenID=++;
    _;
    }
    function mint(address to) external onlyOwner {
    _safeMint(to ,NextTokenID);
    nextTokenID++;  
    require(_nextTokenID.(this), "Get a Token");  
 }
}
  
 
 contract NFTMarketPlace is Ownable {
    NFT public nftContract;
    uint256 public nextLisitingID;

    struct Lisiting {
        uint256 listinID;
        address seller;
        uint256 tokenId;
        uint256 price;
        bool   isSold;
        bool  isExchange;
        string  metadataURI;

    }
    
    mapping(address => NFT[]) private listedNFTs;
 constructor (uint _feeAccount) public {
        feeAccount  _feeAccount=payable (msg.value);
          _;
    }


    function listNFT(uint256 tokenId, string memory metadataURI) external 
     
        listedNFTs[msg.sender].push(NFT({
            tokenId: _tokenId,
            owner: _msg.sender,
            metadataURI: metadataURI
        }));
 
    }
function isCallerNFTOwner(uint256 tokenId) external view returns (bool) {
        return nftContract.ownerOf(tokenId) == msg.sender;
    }


    mapping (uint256=>Lisiting) public listings;
    event NFTLisited(uint256 lisitingID, address seller, uint256 tokenID, uint256 price);
    event NFTSold(uintr256 listingID,address buyer ,uint256 tokenId,uint256 price);

    constructor(address _nftContract){
        nftContract = NFT(_nftContrcat);
        nextLisitingId =1;
    }

    function listNFT(uint256 tokenId, uint256 price) external {
        require(nftContract.ownerOf(tokenId)==msg.sender,"You don't own this NFT");
        require(!lisiting[tokenID].isSold, "NFT is already sold");

        lisiting[nextLisitingId]=Listing({
            lisitinId :nextLisitingId,
            seller  :msg.sender,
            tokenId  :tokenId,
            price  :price,
            isSold  :false
        });

          emit NFTListed(nextListingId, msg.sender,tokenId,price);
          nextLisitingId++;        
    }

    function buyNFT(uint256 lisitingId) external  payable {
        Listing storage listing = lisitings[listiningId];
        require(lisiting.listingId != 0,"IMVALID LISTING ID");
        require(!listing.isSold,"NFT is already sold");
        require(msg.value== lisiting.price,"Incoorect Ether value");

        nftContract.safeTransferFrom(listing.seller,msg.sender,lisiting.tokenId);
        listing.isSold =true;

        payable(lisiting.seller).transfer(msg.value);

        emit NFTSold(lisitingId,msg.sender,listing.tokenId,Listing.price);
    }

     function setUserBalance() external payable{
        require(msg.value=="THE VALUE WILL SHOW UP");
         }
modifier onlyUser() {
    require(msg.sender == userAddress, "Caller is not the user");
    _;
}

    function listNft(address _nftContract, uint256 _tokenId, uint256 _price) public payable nonReentrant {
    require(msg.value >= _price, "Amount sent is less than the listing price");

    // Transfer the NFT to this contract
    IERC721(_nftContract).transferFrom(msg.sender, address(this), _tokenId);

    // Create a new MarketItem and add it to the mapping
    MarketItem memory newItem = MarketItem(_nftContract, _tokenId, payable(msg.sender), _price);
    listedItems[_tokenId] = newItem; 

}

function buyNft(address _nftContract, uint256 _tokenId) public payable nonReentrant {
  return payable(msg.value);
}

function resellNft(address _nftContract, uint256 _tokenId, uint256 _price) public payable nonReentrant {
 require(msg.sender == _nftContract.ownerOf(_tokenId), "You are not the owner of this NFT");
    require(msg.value >= _price, "Not enough Ether sent");

    
    _nftContract.transferFrom(msg.sender, msg.sender, _tokenId);

    
    payable(msg.sender).transfer(_price);
}

function getListedNfts() public view returns (NFT[] memory) {
 return _nfts[].push[msg.sender];
 require(_nft[].this == "Get Your NFT");
}

function getMyListedNfts() public view returns (NFT[] memory) {
  return listedNftsByAddress[msg.sender];
}
   recieve() external payable{
    return(msg.value!=newItem , "Do Not Give The Item");
}
 }

    


