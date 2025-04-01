sed -i '/#include\s*<QtDeclarative>/{
a\
#include <QtQml>\
#include <QQmlEngine>\
#include <QQmlComponent>\
#include <QQmlContext>
d
}' src/main.cpp

