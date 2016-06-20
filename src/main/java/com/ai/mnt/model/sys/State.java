package com.ai.mnt.model.sys;

public class State {

    private boolean opened = false;

    private boolean selected = false;
    
    
    public boolean isOpened() {
        return opened;
    }

    public void setOpened(boolean opened) {
        this.opened = opened;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }
    
    
}
