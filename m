Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE332113
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 10:18:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id h15so11349440plk.12
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3p5TTVCxHUnLOH1pkeavvbt9JRZNuXtyIw1YqMkZt0=;
        b=NcGj0r1OIPBPtu0db4eoVdKvDIViDhN5iuQpq2ovbMIrWqsAak+31s3+mlOv2NLy7P
         JcYbIX8kODKUF1SoFQSXzeuDJquC1bW8gwFDtL4D2rR5/wT48wgkv398aIL+LIX6k4mg
         dLCEOGsmt+3N0LEpAc30PoGmFuHSzLe553QgbqKFMWbADSm9wPJ5NLLa/An8e1s42Psl
         G5cOq0B3bOinux4QrSG7Anc7qV4khUdxlomh40t1ToTKHvSU6Ll7KlRq+EXZu+iLMoR7
         tx1gom0Jcxbf3+P1W9g9TPt96CNib2OLENotAG4LiJa8IW6nK94pQnmVWi8QbtNTBAsN
         +g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3p5TTVCxHUnLOH1pkeavvbt9JRZNuXtyIw1YqMkZt0=;
        b=h6Tr3YF+Z1qdkQkg0o7YaWN6R+jzZPaBM5K0jmRtMCqepHV4ipCE3VSj/52ms/uEXW
         0hg+FaqgPMWqS2WWdUUHbiWpHHAbp36ptzyTOW4WvsQOMlPxcSpcIyvzGT/BaHbwKRZB
         QlegtCvmQe9BvNQn2rJ5Iwn8af4U2WyOCbs2ciEojwWCktJ5ta3C9LP9+TZz8UUPkwnt
         fF2PpK/pntbbw+GaDG0O5ET3ZlJqKuAZb7Z7U/0PoroiSyHtlry1lI4DyNCSYtaG1o7q
         FtbDoihQyMlAy0NF+PJMbF5L2pAAxh602hReT2l/U/rrTksOrM1lDMIhn9hGDI5OZXUr
         ATbA==
X-Gm-Message-State: AO0yUKU1Dj/3n16TAa2MGmnJDLJxDfdbWcC+FaBG9uotxtlAj71JIxC/
	4Gv/4odEG5hxonzydJ0shts=
X-Google-Smtp-Source: AK7set/UIWseGROU/V3PSTpIajcVjPMghekwnQqyUJ5XExLemHjgRzXvTGmItDDRz5zOg0L8i3dtOA==
X-Received: by 2002:a17:902:c70a:b0:199:49fc:610d with SMTP id p10-20020a170902c70a00b0019949fc610dmr1022924plp.15.1675851485492;
        Wed, 08 Feb 2023 02:18:05 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709028d9700b0019926c7757asm3991058plo.289.2023.02.08.02.18.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 02:18:04 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	arnd@arndb.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add LoongArch support to nolibc
Date: Wed,  8 Feb 2023 18:17:49 +0800
Message-Id: <cover.1675851111.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Add statx() and make stat() rely on statx() when available.
Add support for LoongArch (32 and 64 bit) to nolibc.
It was tested on LoongArch64 only.

The latest QEMU support full-system emulation of a LoongArch64
machine, but for the moment we need to specify the firmware manually.
https://github.com/loongson/Firmware/tree/main/LoongArchVirtMachine

QEMU_ARGS_loongarch  = -M virt -bios edk2-loongarch64-code.fd ...

v2:
- Mention that statx() will also benefit other architectures.
- Make stat() rely on statx() when available.
- Put the whitespace changes into one commit.

Feiyang Chen (5):
  tools/nolibc: Include linux/fcntl.h and remove duplicate code
  tools/nolibc: Add statx() and make stat() rely on statx() when
    available
  tools/nolibc: Add support for LoongArch
  selftests/nolibc: Add support for LoongArch
  selftests/nolibc: Adjust indentation for Makefile

 tools/include/nolibc/arch-loongarch.h   | 200 ++++++++++++++++++++++++
 tools/include/nolibc/arch.h             |   2 +
 tools/include/nolibc/sys.h              |  53 ++++++-
 tools/include/nolibc/types.h            |   5 -
 tools/testing/selftests/nolibc/Makefile |  78 ++++-----
 5 files changed, 295 insertions(+), 43 deletions(-)
 create mode 100644 tools/include/nolibc/arch-loongarch.h

-- 
2.39.0

