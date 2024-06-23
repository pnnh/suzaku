//
// Created by Larry on 2024/5/8.
//

#include "SyncThread.h"

#include "services/SyncService.h"

#include <QDebug>

SyncThread::SyncThread() {
  connect(this, &QThread::finished, this, &QObject::deleteLater);
}

SyncThread::~SyncThread() {
  closed = true;
  quit();
  wait();
}

void SyncThread::run() {
  qDebug() << "当前子线程ID:" << QThread::currentThreadId();
  SyncService syncService;
  while (true) {
    if (closed) {
      return;
    }
    QThread::sleep(3);
    // qDebug() << "开始执行本次循环，开始同步数据";
    syncService.SyncLibraries();
    syncService.SyncImages("/Users/Larry/temp");
    // qDebug() << "结束执行本次循环，结束同步数据";
    resultReady("OK");
  }
  qDebug() << "线程结束";
}
