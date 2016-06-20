package com.ai.mnt.model.chart;

public class Legend {
    
    
//    layout: 'vertical',
//    align: 'right',
//    verticalAlign: 'middle',
//    borderWidth: 0
    
    private boolean enabled;
    private String layout;
    private String align;
    private String verticalAlign;
    private int borderWidth;
    
    
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    public String getLayout() {
        return layout;
    }
    public void setLayout(String layout) {
        this.layout = layout;
    }
    public String getAlign() {
        return align;
    }
    public void setAlign(String align) {
        this.align = align;
    }
    public String getVerticalAlign() {
        return verticalAlign;
    }
    public void setVerticalAlign(String verticalAlign) {
        this.verticalAlign = verticalAlign;
    }
    public int getBorderWidth() {
        return borderWidth;
    }
    public void setBorderWidth(int borderWidth) {
        this.borderWidth = borderWidth;
    }
    
}
