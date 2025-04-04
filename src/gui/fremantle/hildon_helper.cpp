/****************************************************************************
**
**  This file is a part of Fahrplan.
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License along
**  with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

#include "hildon_helper.h"
#include <QApplication>

HildonHelper::HildonHelper(QObject *parent) :
    QObject(parent)
{
}

QColor HildonHelper::standardColor(const QString &name)
{
    Q_UNUSED(name);
    return QApplication::palette().color(QPalette::Button);  // Safe fallback
}

QFont HildonHelper::standardFont(const QString &name)
{
    Q_UNUSED(name);
    return QApplication::font();  // Default app font
}

