pragma solidity >=0.6.0 <0.9.0;

contract VotingContract {
    address payable owner;

    uint256 candidateCount = 0;

    uint256 voterCount = 0;

    bool start;

    // Struct of a voter
    struct Voter {
        string name;
        string Id; // Roll number or any other number
        address voterAddress; // Wallet address
        bool hasVoted;
    }

    mapping(address => Voter) private voterAddresses;

    // Struct of a candidate
    struct Candidate {
        uint256 Id;
        string name;
        string details; // manifesto or any other description
        uint256 voteCount; // the number of votes he got
    }

    mapping(address => Candidate) private candidateAddresses;

    // List of all the candidates
    Candidate[] candidates;
    // List of all the voters
    Voter[] voters;

    // Modifier for letting only the owner to add candidates
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    // function to add a new candidate
    function addCandidate(string memory _name, string memory _details)
        public
        onlyOwner
    {
        Candidate memory newCandidate = Candidate({
            Id: candidateCount,
            name: _name,
            details: _details,
            voteCount: 0
        });

        candidates[candidateCount] = newCandidate;

        candidateCount += 1;
    }

    // function to add voter
    // only suitable for a local blockchain
    function manualAddVoter(
        string memory _name,
        string memory _Id,
        address _voterAddress,
        bool _hasVoted
    ) public onlyOwner {
        Voter memory newVoter = Voter({
            name: _name,
            Id: _Id,
            voterAddress: _voterAddress,
            hasVoted: _hasVoted
        });

        voters[voterCount] = newVoter;

        voterCount += 1;
    }

    // actual function to add voters shouldbe done by an oracle
    // work on this later

    // the actual voting function
    function vote(uint256 _Id) private {
        require(voterAddresses[msg.sender].hasVoted == false);
        require(start == true);
        candidates[_Id].voteCount += 1;
        voterAddresses[msg.sender].hasVoted = true;
    }

    // onlyOwner function for starting the election
    function startElection() public onlyOwner {
        start = true;
    }

    // onlyOwner function to end election
    function endEelection() public onlyOwner {
        start = false;
    }

    // public function to view election status (use this in dashboard)
    function electionStatus() public view returns (bool) {
        return (start);
    }
}
