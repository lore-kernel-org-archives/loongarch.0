Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2BC8DE
	for <loongarch@lists.linux.dev>; Wed, 22 Nov 2023 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlQ9JDIk"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5b9a456798eso3885625a12.3
        for <loongarch@lists.linux.dev>; Tue, 21 Nov 2023 21:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700630063; x=1701234863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVOBQ+EF5PCV2XE8MVYpjJVMlJ9/L2nYsVbQXFXpgWI=;
        b=ZlQ9JDIk57ht/Z1HP8mF/LrTw3q9q3+tGfEskSzWFaF8Ecwnpn5E9+thYREbJmtbg8
         fg4HFaQt2Jzrnla0I6oWtD9OCtNo8TH8+GHfyTZ6DBq56mGytEAi2Nsu+z89QjViTp0w
         bJfYAPVADMJdfTWqo25vXwh7Lzla0EYObvK3r7gfyu+6QTO8VHUQ9yYQT0tROItBTIsF
         V1crpPXdRGCt/3vh8Ht4BfC2m15TuvNyAdopgjeA+TbaA/lxEfh1mtvP4mTT6PBRv8zj
         No8uw4qDvPD1XzXyZlirQ/brVHFpHNfJbu8zZHUBmR4qylkP/Av3LrNRVZ/uD+I+Ds1h
         Wu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700630063; x=1701234863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVOBQ+EF5PCV2XE8MVYpjJVMlJ9/L2nYsVbQXFXpgWI=;
        b=vvFZRPukRmhc2kFNCYZTyhJ7KtkrXrMQ8rt86+kAJSfSUlUE98ica4MqHtdTwAiDwS
         yZNA0/yN4/Lknlc+ZLH79TnbAIi1Py39E5bBeFn5dkUco6rggUa4lwiQnv1vKgLu5GD8
         OwEkmj20N5uqeFB3UuZoVApnNIIB6kj+rOMXQceM035j7egnpVN0BUycMmEpim/GrdVq
         4XKCk+9vTp7JN3nYsmRghT3cSwGCPqtdZXhF97bIPKpISNFBTL2qa55INKrl3BQLjFCH
         yuSbP0avF92XUN4/rBq2H3fzlF8wgd3LNcg8aKfjWRIyJAVJ/SZjzOfZqrGNueTg2yaW
         rKiw==
X-Gm-Message-State: AOJu0YxXbZaytqOWhIwc6z5UdopSffEWbhCSU7BkREp77mBDnbSXBj4s
	H0TTNVInXwDqtRiKLq2f/Z9Wwh+TPwK7kA==
X-Google-Smtp-Source: AGHT+IEqrBpsGjYqtwRyzhHITc5ohdars6UTK+RpziaLZNovgH2QM6mksaU9id0KKduqtAvH3ssAIg==
X-Received: by 2002:a05:6a21:99a4:b0:186:e53:b64b with SMTP id ve36-20020a056a2199a400b001860e53b64bmr1170278pzb.47.1700630063262;
        Tue, 21 Nov 2023 21:14:23 -0800 (PST)
Received: from ubuntu.. ([43.132.98.102])
        by smtp.googlemail.com with ESMTPSA id f8-20020a17090ac28800b002774d7e2fefsm424533pjt.36.2023.11.21.21.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 21:14:23 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: Store syscall nr in thread_info
Date: Tue, 21 Nov 2023 07:02:09 +0000
Message-Id: <20231121070209.210934-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we store syscall number in pt_regs::regs[11] and it may be
changed during syscall execution. Take `execve` as an example:

    sys_execve
      -> do_execve
        -> do_execveat_common
          -> bprm_execve
            -> exec_binprm
              -> search_binary_handler
                -> load_elf_binary
                  -> ELF_PLAT_INIT

ELF_PLAT_INIT reset regs[11] to 0, later in syscall_exit_to_user_mode
we get a wrong syscall nr.

Known affected syscalls includes execve/execveat/rt_sigreturn. Tools
like execsnoop do not work properly because the sys_exit_* tracepoints
does not trigger at all.

Let's store syscall nr in thread_info instead.

Fixes: be769645a2aef ("LoongArch: Add system call support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/include/asm/syscall.h | 2 +-
 arch/loongarch/kernel/syscall.c      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
index e286dc58476e..2317d674b92a 100644
--- a/arch/loongarch/include/asm/syscall.h
+++ b/arch/loongarch/include/asm/syscall.h
@@ -23,7 +23,7 @@ extern void *sys_call_table[];
 static inline long syscall_get_nr(struct task_struct *task,
 				  struct pt_regs *regs)
 {
-	return regs->regs[11];
+	return task_thread_info(task)->syscall;
 }
 
 static inline void syscall_rollback(struct task_struct *task,
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index b4c5acd7aa3b..2783e33cf276 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -52,6 +52,7 @@ void noinstr do_syscall(struct pt_regs *regs)
 	regs->orig_a0 = regs->regs[4];
 	regs->regs[4] = -ENOSYS;
 
+	task_thread_info(current)->syscall = nr;
 	nr = syscall_enter_from_user_mode(regs, nr);
 
 	if (nr < NR_syscalls) {
-- 
2.42.0

