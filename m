Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE87F
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 02:09:51 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 7so9531871pga.1
        for <loongarch@lists.linux.dev>; Mon, 06 Feb 2023 18:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2R4Y9BugjZxBru4uI7Lx5wAt6TYg7t074pOgVYye8E=;
        b=lNOlZD+5V8nUreql8W9A+qDr4wrT9YB+MUB2mZwi8dg7i5zLJDI4UrhlDGAAS0Wv+x
         /ANoZlzhDXuQKAehf7Ek9haEgVOhFP/nktYYftJ/05dTbAJjpKR+B0/SU6R/kZD6l0BE
         aGp2ut44NrzxEkciRcGtNlIxM6GM1JyaSEId1Zgp+0FKTKHm/GuGm2mQotsMZ/20Ljv9
         rH+okBG5f9PJ/jUaSH2lfS5/QbnpfZD+t6ufW4QfzWPrEZH6+x0MpdHWIY1Nhk6rNEfq
         lDHzHrM6mk1sKws+AB3mkqqkP+yMgmm8gALlkD8mV8y99GP9NEAA7eF56Kh2Si8MoNpm
         Bdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2R4Y9BugjZxBru4uI7Lx5wAt6TYg7t074pOgVYye8E=;
        b=2XN5HbMNRp3NRN80k2bxp6nxrmGHFj5WhruGzMrQvglsDqnzPJN38UHiygPl6hAH3T
         lE/GDSBb+xPpS4v/IFD5yYq8YW1qC9fIN6b0uiVL3/vZ9Vzko+i1idS2u9oCUGprTrKp
         jsWpeSz3xPKdQNMSECjZfxKtxcbPYJZchVEMt7FqzKcgJBDfuJqCCOFM59mTgQq08zkx
         IJ1fRiMjVcbZwKvnKF+tCC9Sbmufi/8+o8LIIJaXlkhNt6xEtic+vIPdzV2JGw9zrclK
         1FpIjFVOO9QzAvpqUF1cvj2fAzvW5mlhDNs/YlSqazIBZXROMPQGsrXc5rlh6WAQ/Ij5
         Q6eg==
X-Gm-Message-State: AO0yUKW9No7gQQ1giiYTTYLxZmjD4ZYVA1+K2YQtQ+SbPPlGY938FSBt
	QjUomaFoMbMAONOEVDqVt8M=
X-Google-Smtp-Source: AK7set8P+8Tyeug8YnzFi0k2BWMjzEYOH2in+brOqernlAo8WHDuk+fjg8+Ermr6nIP9kszwOpzixQ==
X-Received: by 2002:aa7:9a0d:0:b0:590:753d:78f5 with SMTP id w13-20020aa79a0d000000b00590753d78f5mr1403975pfj.20.1675735790360;
        Mon, 06 Feb 2023 18:09:50 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id d198-20020a621dcf000000b00593225b379dsm7843765pfd.106.2023.02.06.18.09.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Feb 2023 18:09:49 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	arnd@arndb.de,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add LoongArch support to nolibc
Date: Tue,  7 Feb 2023 10:09:39 +0800
Message-Id: <cover.1675734681.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Add statx() support to implement sys_stat().
Add support for LoongArch (32 and 64 bit) to nolibc.
It was tested on LoongArch64 only.

The latest QEMU support full-system emulation of a LoongArch64
machine, but for the moment we need to specify the firmware manually.
https://github.com/loongson/Firmware/tree/main/LoongArchVirtMachine

QEMU_ARGS_loongarch  = -M virt -bios edk2-loongarch64-code.fd ...

Feiyang Chen (3):
  nolibc: Add statx() support to implement sys_stat()
  nolibc: Add support for LoongArch
  selftests/nolibc: Add support for LoongArch

 tools/include/nolibc/arch-loongarch.h   | 223 ++++++++++++++++++++++++
 tools/include/nolibc/arch.h             |   2 +
 tools/include/nolibc/sys.h              |  36 +++-
 tools/include/nolibc/types.h            |  46 +++++
 tools/testing/selftests/nolibc/Makefile |  78 +++++----
 5 files changed, 345 insertions(+), 40 deletions(-)
 create mode 100644 tools/include/nolibc/arch-loongarch.h

-- 
2.39.0

