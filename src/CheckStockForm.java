import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;

public class CheckStockForm extends javax.swing.JFrame {

    public CheckStockForm() {
        initComponents();
    }
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url ="jdbc:sqlserver://localhost:1433;databaseName=Camera_Gear_Store";
    String user ="sa";
    String password ="Khoday1945";
    
    PreparedStatement pst;
    Statement st;
    ResultSet rs;
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCloseCSF = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tableCSF = new javax.swing.JTable();
        btnRefreshCSF = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        btnPrintCSF = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setName("CheckStockForm"); // NOI18N
        setSize(new java.awt.Dimension(340, 290));

        btnCloseCSF.setText("Close");
        btnCloseCSF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnCloseCSF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCloseCSFActionPerformed(evt);
            }
        });

        tableCSF.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tableCSF.getTableHeader().setReorderingAllowed(false);
        jScrollPane1.setViewportView(tableCSF);

        btnRefreshCSF.setText("Refresh");
        btnRefreshCSF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnRefreshCSF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshCSFActionPerformed(evt);
            }
        });

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Check Stock Form:");
        jLabel1.setPreferredSize(new java.awt.Dimension(150, 25));

        btnPrintCSF.setText("Print");
        btnPrintCSF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnPrintCSF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPrintCSFActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnRefreshCSF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 37, Short.MAX_VALUE)
                        .addComponent(btnPrintCSF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(37, 37, 37)))
                .addComponent(btnCloseCSF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(38, 38, 38))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnRefreshCSF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCloseCSF, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnPrintCSF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 24, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 414, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCloseCSFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCloseCSFActionPerformed
        this.setVisible(false);
        Main.showMainMenuForm();
    }//GEN-LAST:event_btnCloseCSFActionPerformed

    private void btnRefreshCSFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshCSFActionPerformed
        try
        {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        
        String sql = "select*from Items.Products";
        st = con.createStatement();
        rs = st.executeQuery(sql);

        tableCSF.setModel(DbUtils.resultSetToTableModel(rs));
        }
        catch (Exception e)
        {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }//GEN-LAST:event_btnRefreshCSFActionPerformed

    private void btnPrintCSFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPrintCSFActionPerformed
        try
        {
        tableCSF.print();
        }
        
        catch(java.awt.print.PrinterException e)
        {
            System.err.format("No Printer Found", e.getMessage());
        } 
    }//GEN-LAST:event_btnPrintCSFActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CheckStockForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCloseCSF;
    private javax.swing.JButton btnPrintCSF;
    private javax.swing.JButton btnRefreshCSF;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tableCSF;
    // End of variables declaration//GEN-END:variables
}
