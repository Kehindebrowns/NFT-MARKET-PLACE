const { ethers } = require("hardhat");

describe("NFTMarketplace", function() {
    let deployer, addr1, addr2;
    let feePercent;
    let sampleURI;
    let nft, marketplace;

    beforeEach(async () => {
        [deployer, addr1, addr2] = await ethers.getSigners();
        const NFT = await ethers.getContractFactory("NFT");
        const NFTMarketplace = await ethers.getContractFactory("NFTMarketplace");
        nft = await NFT.deploy();
        marketplace = await NFTMarketplace.deploy();
      });

    describe("Deployment", function() {
        it("Should track the name and symbol of the NFT collection", async function() {
            expect(await nft.name()).to.equal("NFT Marketplace");
            expect(await nft.symbol()).to.equal("NFT");
          });
      });

    describe("Minting NFTs", function() {
        it("Should mint an NFT and track its details", async function() {
            const URI = "sampleURI";
            await nft.connect(addr1).mint(URI);

            expect(await nft.tokenCount()).to.equal(1);
            expect(await nft.balanceOf(addr1.address)).to.equal(1);
            expect(await nft.tokenURI(1)).to.equal(URI);
          });
     });
});
