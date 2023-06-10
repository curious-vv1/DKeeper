import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {

  //Create a datatype that can be accessed
  public type Note = {
    title : Text;
    content : Text;
  };

  //Create a lit i.e. array of the note.
  stable var notes : List.List<Note> = List.nil<Note>();

  //To send text from javascript
  public func createNote(titleText : Text, contentText : Text) {

    let newNote : Note = {
      title = titleText;
      content = contentText;
    };

    //the new changes notes
    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));

  };

  //retreiving data or reading (whenever there is no update in data always better to use query as it is faster)
  public query func readNotes() : async [Note] {
    return List.toArray(notes);  // Transforming list to array because it is how rendered in react
  };


//delete data from list
  public func removeNote(id : Nat) {   // if notes is D C B A

    let front = List.take(notes, id);   // gives  D C
    let back = List.drop(notes, id + 1); // gives  A
    notes := List.append(front, back); // gives D C A

  };

};
