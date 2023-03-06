import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;

public class UpdatesRecordForm extends javax.swing.JFrame {

    public UpdatesRecordForm() {
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
        tableURF = new javax.swing.JTable();
        btnRefreshURF = new javax.swing.JButton();
        btnCloseURF1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tableURF.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tableURF);

        btnRefreshURF.setText("Refresh");
        btnRefreshURF.setPreferredSize(new java.awt.Dimension(150, 25));
        btnRefreshURF.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshURFActionPerformed(evt);
            }
        });

        btnCloseURF1.setText("Close");
        btnCloseURF1.setPreferredSize(new java.awt.Dimension(150, 25));
        btnCloseURF1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCloseURF1ActionPerformed(evt);
            }
        });

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Updates Record:");
        jLabel1.setPreferredSize(new java.awt.Dimension(175, 25));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(100, 100, 100)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(100, 100, 100)
                .addComponent(btnRefreshURF, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(100, 100, 100)
                .addComponent(btnCloseURF1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(750, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnRefreshURF, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCloseURF1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 30, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 509, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnRefreshURFActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshURFActionPerformed
        try
        {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        
        String sql = "select*from Sales.UpdatesView";
        st = con.createStatement();
        rs = st.executeQuery(sql);

        tableURF.setModel(DbUtils.resultSetToTableModel(rs));
        }
        catch (Exception e)
        {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }//GEN-LAST:event_btnRefreshURFActionPerformed

    private void btnCloseURF1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCloseURF1ActionPerformed
        this.setVisible(false);
        Main.showMainMenuForm();
    }//GEN-LAST:event_btnCloseURF1ActionPerformed

    public static void main(String args[]) {
    java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new UpdatesRecordForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCloseURF1;
    private javax.swing.JButton btnRefreshURF;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tableURF;
    // End of variables declaration//GEN-END:variables
}
