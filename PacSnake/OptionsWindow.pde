import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class OptionsWindow extends JFrame implements ActionListener {
  //Field Variables
  private boolean start;
  private JButton submit;
  private JTextField pmanName;
  private JTextField blinkyName;
  private JTextField clydeName;
  private JTextField inkyName;
  private JTextField pinkyName;
  private JTextField fruitName;
  private JTextField pelletName;
  private JTextField wallName;
  private JTextField vulName;

  public String pman;
  public String blinky;
  public String clyde;
  public String inky;
  public String pinky;
  public String fruit;
  public String pellet;
  public String wall;
  public String vul;


  /** Simple Constructor for SaveAsWindow */
  public OptionsWindow() {
    setTitle("Options Menu");
    setSize(600, 600);
    setLocation(100, 100);
    setLayout(new FlowLayout());


    JLabel pacman = new JLabel("Pac-Man");
    pmanName = new JTextField(48);
    pacman.setLabelFor(pmanName);

    JLabel blinky = new JLabel("Blinky");
    blinkyName = new JTextField(48);
    blinky.setLabelFor(blinkyName);

    JLabel clyde = new JLabel("Clyde");
    clydeName = new JTextField(48);

    JLabel inky = new JLabel("Inky");
    inkyName = new JTextField(48);

    JLabel pinky = new JLabel("Pinky");
    pinkyName = new JTextField(48);

    JLabel fruit = new JLabel("Fruit");
    fruitName = new JTextField(48);

    JLabel pellet = new JLabel("Pellet");
    pelletName = new JTextField(48);

    JLabel wall = new JLabel("Wall");
    wallName = new JTextField(48);

    JLabel vul = new JLabel("Blue Ghost");
    vulName = new JTextField(48);

    submit = new JButton("Start!!!");
    submit.addActionListener(this);

    add(pacman);
    add(pmanName);
    add(blinky);
    add(blinkyName);
    add(inky);
    add(inkyName);
    add(pinky);
    add(pinkyName);    
    add(fruit);
    add(fruitName);
    add(pellet);
    add(pelletName);   
    add(wall);
    add(wallName); 
    add(vul);
    add(vulName); 

    add(submit);
    setVisible(true);
    //setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
  }

  public void actionPerformed(ActionEvent event) {
    if (event.getActionCommand().equals("Start!!!")) {
      pman = pmanName.getText();
      println(pman);
      blinky = blinkyName.getText();
      clyde = clydeName.getText();
      inky = inkyName.getText();
      pinky = pinkyName.getText();
      fruit = fruitName.getText();
      pellet = pelletName.getText();
      wall = wallName.getText();
      vul = vulName.getText();
      start = true;
      this.dispose();
    }
  }

  public boolean isStart() {
    return start;
  }
}