import javax.swing.JOptionPane;

public class Main
{
    private static LoginForm LF;
    private static MainMenuForm MMF;
    private static PurchaseForm PF;
    private static CheckStockForm CSF;
    private static UpdatesForm UF;
    private static PurchaseRecordForm PRF;
    private static UpdatesRecordForm URF;
        private static PurchaseRecordDetailForm SRDF;
    
   
    /*-------------show-------------*/
    public static void showLoginForm()
    {
        LF.setVisible(true);
    }
    public static void showMainMenuForm()
    { 
        MMF.setVisible(true);
    }
    public static void showPurchaseForm()
    {
        PF.setVisible(true);
    }
    public static void showCheckStockForm()
    {
        CSF.setVisible(true);
    }
    public static void showUpdatesForm()
    {
        UF.setVisible(true);
    }
    public static void showPurchaseRecordForm()
    {
        PRF.setVisible(true);
    }
        public static void showUpdatesRecordForm()
    {
        URF.setVisible(true);
    }
    public static void showStockRecordDetailForm()
    {
        SRDF.setVisible(true);
    }

    
    
    public static void main(String[] args)
    {
        java.awt.EventQueue.invokeLater(new Runnable()
        {
            public void run() {
             
                LF = new LoginForm();
                MMF = new MainMenuForm();
                PF = new PurchaseForm();
                CSF = new CheckStockForm();
                UF = new UpdatesForm();
                PRF = new PurchaseRecordForm();
                URF = new UpdatesRecordForm();
                SRDF = new PurchaseRecordDetailForm();
        
                LF.setVisible(true);
            }
        });
    } 
}
