Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99963B9
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 05:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWjlExHh"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ce3df4c282so494447b3a.1
        for <loongarch@lists.linux.dev>; Sun, 03 Dec 2023 21:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701668276; x=1702273076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnzakWWTPefczRwe0AUqwBR6P05bTOhOzQjQ32Oe5oU=;
        b=IWjlExHhLkFQqKEqFuInmc3ocqPqMh/XZXP2GDx+qE1mhWXvUSFGzAvK74DyhJkCDs
         qld2ej/hKJWyftqHiTwu18jv4QvWVwvx75BWyLFIk233PNHMWfwBkOQj6DiXXqTxIBWX
         NeaCbPqX6L8UI9FdlFzAmdEHloBFM5HfrSJSpZjBAbkf4Yzu0I7O1nXmXKz7YypBHu1J
         RqsCG9V2Lg1MaEOCofJHmW9VkJ/xLrEgx5JX0pIfDieVrLGtiZffMb+Nzrhkk0QSYa5H
         x0JmL94IkQJbWjpe1L9QHADxctlWrGt9KrCZN544vVQeeOd3juthkTJep/ShcUYWu1NU
         z/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701668276; x=1702273076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnzakWWTPefczRwe0AUqwBR6P05bTOhOzQjQ32Oe5oU=;
        b=p/kr0LLtPkL55G6dMAa5KrlxnrVksniRebjetP49StsRPMclQArSufeshxOG3D0abU
         xzEzSUhYxs5ozogj9ofq1H9jdSHPDR/uttjsCO6+GODR/7ZS4uWovKOauJ4nO0w1YpNo
         aswYQ/ALv+eOk6pxlCstB3hmbNf8Du8e2pVZJa8qDjRCRVn7MImz4+8iHlqCExsiIyzq
         6qsDnygNbJasqaWnTjp4pcgE5o11UQccFqweNwaxW9FfZo/ifn54rYjAYdXOUQ6i1HtA
         61WqY1aDOkS9v6QrjyzJTNJu0aDEGv91L+qPY5UlzZfzbPrJG8TbT0LU0Iz3myQcq+x+
         fuSA==
X-Gm-Message-State: AOJu0YwEg9fDpx1TZg6Nuyu5XZ3O2OUnqix23jqzkKAgYQzjYfHugXEg
	xZxlW5WCwEx9YMROWhHIac73voKVphI0jA==
X-Google-Smtp-Source: AGHT+IHAL8q57kzH+GyJZ7Bo3E/eUMhLKpr3fbawlpY8Uo3Uij60gzAgw6Piw5FeVsdH0CLyISxY2Q==
X-Received: by 2002:a05:6a00:2410:b0:68f:f650:3035 with SMTP id z16-20020a056a00241000b0068ff6503035mr1308586pfh.12.1701668276265;
        Sun, 03 Dec 2023 21:37:56 -0800 (PST)
Received: from ubuntu.. ([43.132.98.100])
        by smtp.googlemail.com with ESMTPSA id r9-20020aa78449000000b0069ee4242f89sm3005431pfn.13.2023.12.03.21.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 21:37:55 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: Preserve syscall nr across execve
Date: Mon,  4 Dec 2023 05:37:45 +0000
Message-Id: <20231204053745.3153-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we store syscall nr in pt_regs::regs[11] and
syscall execve accidentally overrides it during its execution:

    sys_execve
      -> do_execve
        -> do_execveat_common
          -> bprm_execve
            -> exec_binprm
              -> search_binary_handler
                -> load_elf_binary
                  -> ELF_PLAT_INIT

ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to_user_mode
we get a wrong syscall nr. This breaks tool like execsnoop since it
relies on execve tracepoints.

Skip pt_regs::regs[11] reset in ELF_PLAT_INIT to fix the issue.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/include/asm/elf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index b9a4ab54285c..fb9261164a34 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -293,7 +293,7 @@ extern const char *__elf_platform;
 #define ELF_PLAT_INIT(_r, load_addr)	do { \
 	_r->regs[1] = _r->regs[2] = _r->regs[3] = _r->regs[4] = 0;	\
 	_r->regs[5] = _r->regs[6] = _r->regs[7] = _r->regs[8] = 0;	\
-	_r->regs[9] = _r->regs[10] = _r->regs[11] = _r->regs[12] = 0;	\
+	_r->regs[9] = _r->regs[10] = /* syscall nr */ _r->regs[12] = 0;	\
 	_r->regs[13] = _r->regs[14] = _r->regs[15] = _r->regs[16] = 0;	\
 	_r->regs[17] = _r->regs[18] = _r->regs[19] = _r->regs[20] = 0;	\
 	_r->regs[21] = _r->regs[22] = _r->regs[23] = _r->regs[24] = 0;	\
-- 
2.27.0

