#include "BoxLayout.h"
#include "Button.h"
#include "Label.h"
#include "MessageBox.h"


namespace phui {

    MessageBox::MessageBox(const std::string& title, const std::string& message) {
        ButtonPtr ok = new Button("OK");
        ok->addListener(this, &MessageBox::onOK);

        add(new Label(message));
        add(ok);

        setTitle(title);
        setSize(600, 200);
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
    }

    void MessageBox::onOK(const ActionEvent&) {
        endModal();
    }

}
