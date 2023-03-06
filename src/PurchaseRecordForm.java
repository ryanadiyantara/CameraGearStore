import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;


public class PurchaseRecordForm extends javax.swing.JFrame {

    public PurchaseRecordForm() {
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

        jScrollPane1 = new javax.swing.JScrollPane();
        tableSRF = new javax.swing.JTable();
        btnRefreshSRF = new javax.swing.JButton();
        btnRecordDetailSRF = new javax.swing.JButton();
        btnCloseSRF = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tableSRF.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tableSRF);

        btnRefreshSRF.setText("Refresh");
        btnRefreshSRF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnRefreshSRF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshSRFActionPerformed(evt);
            }
        });

        btnRecordDetailSRF.setText("Record Detail");
        btnRecordDetailSRF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnRecordDetailSRF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRecordDetailSRFActionPerformed(evt);
            }
        });

        btnCloseSRF.setText("Close");
        btnCloseSRF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnCloseSRF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCloseSRFActionPerformed(evt);
            }
        });

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Purchase Record:");
        jLabel1.setPreferredSize(new java.awt.Dimension(175, 25));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(100, 100, 100)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(100, 100, 100)
                .addComponent(btnRefreshSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(100, 100, 100)
                .addComponent(btnRecordDetailSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(100, 100, 100)
                .addComponent(btnCloseSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(475, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnRefreshSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnRecordDetailSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCloseSRF, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 30, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 509, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnRefreshSRFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshSRFActionPerformed
        try
        {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        
        String sql = "select*from Sales.PurchasesView";
        st = con.createStatement();
        rs = st.executeQuery(sql);

        tableSRF.setModel(DbUtils.resultSetToTableModel(rs));
        }
        catch (Exception e)
        {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }//GEN-LAST:event_btnRefreshSRFActionPerformed

    private void btnRecordDetailSRFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRecordDetailSRFActionPerformed
        this.setVisible(false);
        Main.showStockRecordDetailForm();
    }//GEN-LAST:event_btnRecordDetailSRFActionPerformed
    private void btnCloseSRFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCloseSRFActionPerformed
        this.setVisible(false);
        Main.showMainMenuForm();
    }//GEN-LAST:event_btnCloseSRFActionPerformed

    public static void main(String args[]) {

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PurchaseRecordForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCloseSRF;
    private javax.swing.JButton btnRecordDetailSRF;
    private javax.swing.JButton btnRefreshSRF;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tableSRF;
    // End of variables declaration//GEN-END:variables
}
