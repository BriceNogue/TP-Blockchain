pragma solidity ^0.8.7;
contract exercice {
struct eleve {
string nom;
string prenom;
uint[] notes;
}
mapping(address => eleve) Eleves;

address owner;

// 0x1234567890123456789012345678901234567890

modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    _;
}

constructor() {
        owner = msg.sender;
}

function addNote(address _eleve, uint _note) public onlyOwner {
    require(_note >= 0 && _note <= 100, "La note doit etre entre 0 et 100");
    Eleves[_eleve].notes.push(_note);
}
function getNote(address _eleve) public onlyOwner view returns (uint[] memory) {
return Eleves[_eleve].notes;
}
function setNom(address _eleve, string memory _nom) public {
Eleves[_eleve].nom = _nom;
}
function getNom(address _eleve) public view returns (string memory) {
return Eleves[_eleve].nom;
}
function getSender() public view returns (address) {
return msg.sender;
}
}