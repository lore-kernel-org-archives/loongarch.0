Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E7627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:24:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id v23so1497134plo.1
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKunBXC3vQ45FVVBeIZmijePAOg8/w3l9r8B7emsY08=;
        b=m9f+D936Lynz8XfhzqYAPeS/gqaRhHAhH45wb77Vehe0foBNIiaUrjCzh22yFC+0mK
         dW7jpoad/pVZo49x0Gvfq4bSkv7iXTtEKpsB7loVtxytqmBpME7Lz62+pMb2jaBXOuTh
         0TYNRi52BzoAP1e5yHopuT3YTrEyxBlk4OwSNt2QgXgM154QaEMNeWQ0RRia7wA3fuUG
         dPWrCWZVUwz12Lqvg5gFgB25yleiPMma4Gku2hm6Yx0E5iNvk06MmZNI9PdtzU/gcGn9
         M0ugKYNaeZSGH4vOv/2eHeWu1bR124S/4sfXtojudOeNj9iDCV2BOeiP2YWUU35S4bff
         /f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKunBXC3vQ45FVVBeIZmijePAOg8/w3l9r8B7emsY08=;
        b=MoarV7O69ZZj1ZKuO54eIfc/LRPXJyNZAchBZAXfT4twyP2HASMwXzheKNEF/4cXlj
         VAIBSdaEqLQ/gdlJ4w9tLLDwZbCat/rUUyTHMdEwARrnZR7qzy9awapnEoGZhyLDRFym
         VMB6xtA+fVjvymZPMYU7+E93tufe9kJiiFO/zdeygkmbrgwkAyAQIHH12M+gqERIjpRx
         QWg/sOf9Y6k67WvxH87YR6msS6J11dyeYxpCXBw7fE6SijR54weu2Ak+VBxlO5zQU2zg
         XTOoQpfJyTohJDlqHZzX6EkDVJT51FzAzLjb6ohZiy1SLrYWjYzMwptHhfz0S0pmYRr8
         o2cg==
X-Gm-Message-State: AO0yUKXLlGF1WUwOyFhAU2tXRGWZJu5cbV3aMbn4QODd4FHi2hITqr8J
	UjqAq7uxnlax6wpGIOCQtnw=
X-Google-Smtp-Source: AK7set/DkLLYt3R1VK/wnJ0Ej7bGTH7R6PF4H6QPNl5GJOp344SFGftIIHiCCF//lA+MRKbB9GmASQ==
X-Received: by 2002:a17:902:d2cf:b0:195:e590:c7c6 with SMTP id n15-20020a170902d2cf00b00195e590c7c6mr9981058plc.22.1675913064918;
        Wed, 08 Feb 2023 19:24:24 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm216086pld.120.2023.02.08.19.24.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:24:24 -0800 (PST)
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
Subject: [PATCH v3 0/5] Add LoongArch support to nolibc
Date: Thu,  9 Feb 2023 11:24:11 +0800
Message-Id: <cover.1675907639.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Add statx() and make stat() rely on statx() if necessary.
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

v3:
- Add #if defined(__NR_statx) guard.
- Keep the check for statx() from the first version.
- Mention that we may use statx() everywhere in the future.
- struct statx stat -> struct statx statx.

Feiyang Chen (5):
  tools/nolibc: Include linux/fcntl.h and remove duplicate code
  tools/nolibc: Add statx() and make stat() rely on statx() if necessary
  tools/nolibc: Add support for LoongArch
  selftests/nolibc: Add support for LoongArch
  selftests/nolibc: Adjust indentation for Makefile

 tools/include/nolibc/arch-loongarch.h   | 200 ++++++++++++++++++++++++
 tools/include/nolibc/arch.h             |   2 +
 tools/include/nolibc/sys.h              |  58 ++++++-
 tools/include/nolibc/types.h            |   5 -
 tools/testing/selftests/nolibc/Makefile |  78 ++++-----
 5 files changed, 300 insertions(+), 43 deletions(-)
 create mode 100644 tools/include/nolibc/arch-loongarch.h

-- 
2.39.0

