Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671F625
	for <loongarch@lists.linux.dev>; Fri, 24 Nov 2023 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB9OMlBQ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so1076139a12.2
        for <loongarch@lists.linux.dev>; Thu, 23 Nov 2023 17:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700790511; x=1701395311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1v0zD5ohGSHo01XfRcFHZXPgTcO33uYH5dgRj4yXKI=;
        b=kB9OMlBQJz30xNItWkqjj2BJcajH7tpT//yXwjmoWdZiQnx9KEWRn44rG77xZjxnY6
         2O2B4o264mbAssFMHUuQqAccqcK5rRZYcFshI5tao6ChrnWchhswWTSaK+t2X13FWjtH
         C9E1hoW6sLOzJK3l8cyW0miKRHB4K3VvGYBassP2bG92tm8zO07Ms3EPIOHv3PshR4eT
         L/g0gVO9SMxYn9UURBXpGEUYmIawJybWkELoZTB7mTtcDxf1FXgGSJcL1lt/S97hOYpC
         iPmzm02M7BH9mXwL/35XCPqgjtjINoLplIjhlv0M/PyeleipusidL3DzcCcCwefz3Rzd
         R9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700790511; x=1701395311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1v0zD5ohGSHo01XfRcFHZXPgTcO33uYH5dgRj4yXKI=;
        b=UPMSXE++x027Hi+QxCbzyXXcKcz8ma35W5k4Sx/9FDWMlb1t6u0+Axv2hty/1aTErD
         SXvjrYkC0OMjfyNYgrySgmHEmVQ4ZpjHrdGU0rte+m9xpn4aII8NAQQXAjCXCatEYl5/
         mTvlqmpTCY7vNyUI8x3Bi4MRBcZ+KNQYyGRXFufh95JcSqGQC0Q3BOxhpDpRsQnWrlrm
         ttg4LEwReXiA3CVe17dnwd+2jGholcfUhFTKWAAZpFtRfYQDRa0EPSOBlbTGi6jGxNVT
         UdsuOqfNCIo+xNRQA5lPX2d/hEVlw376CXmk0owDgj9qC+92lrmOqoXhq7sQUc2FiNza
         1wxw==
X-Gm-Message-State: AOJu0YzgfDL6/78+kCdLBb7MsiEgSJF2PUCHWPkoxmLUcCFucLc9rQWW
	7xNI5fX8l367ujSqRFENTYTYPRVheSig+g==
X-Google-Smtp-Source: AGHT+IF06BLNSwgp+g9/KiD9JxAG8XANBdzU+i3wYo6W7ohWsUZBncHbeGyyIu0VhosXhT37L3F6SQ==
X-Received: by 2002:a17:90b:1c8b:b0:27c:f309:f381 with SMTP id oo11-20020a17090b1c8b00b0027cf309f381mr1471332pjb.6.1700790510583;
        Thu, 23 Nov 2023 17:48:30 -0800 (PST)
Received: from ubuntu.. ([203.205.141.11])
        by smtp.googlemail.com with ESMTPSA id qa9-20020a17090b4fc900b00274b035246esm3718894pjb.1.2023.11.23.17.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 17:48:30 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Subject: [PATCH] LoongArch: Check unwind_error() in show_backtrace()
Date: Fri, 24 Nov 2023 01:48:22 +0000
Message-Id: <20231124014822.7894-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While tracking down the CPU stall issues ([0]), I saw
that show_backtrace() stuck in an infinite loop ([1]):

  [  153.610816] Call Trace:
  [  153.610929] [<9000000002723eb8>] show_stack+0x5c/0x180
  [  153.611252] [<90000000038e9954>] dump_stack_lvl+0x60/0x88
  [  153.611349] [<90000000038cf8ec>] rcu_dump_cpu_stacks+0xf8/0x150
  [  153.611452] [<90000000027dc5dc>] rcu_sched_clock_irq+0x69c/0xf10
  [  153.611585] [<90000000027f0dfc>] update_process_times+0x6c/0xb4
  [  153.611696] [<9000000002801fb8>] tick_nohz_highres_handler+0x54/0xe0
  [  153.611808] [<90000000027f1898>] __hrtimer_run_queues+0x178/0x344
  [  153.611909] [<90000000027f29dc>] hrtimer_interrupt+0x108/0x28c
  [  153.612009] [<90000000027269c4>] constant_timer_interrupt+0x38/0x48
  [  153.612113] [<90000000027b7824>] __handle_irq_event_percpu+0x68/0x24c
  [  153.612223] [<90000000027b7a20>] handle_irq_event_percpu+0x18/0x6c
  [  153.612327] [<90000000027bdae0>] handle_percpu_irq+0x54/0x88
  [  153.612420] [<90000000027b6af8>] generic_handle_domain_irq+0x28/0x40
  [  153.612524] [<9000000003085b0c>] handle_cpu_irq+0x6c/0xa8
  [  153.612621] [<90000000038e9c28>] handle_loongarch_irq+0x30/0x48
  [  153.612721] [<90000000038e9cc0>] do_vint+0x80/0xb4
  [  153.612906] [<90000000038e9cc0>] do_vint+0x80/0xb4
  [  153.612985] [<90000000038e9cc0>] do_vint+0x80/0xb4
  [  153.613066] [<90000000038e9cc0>] do_vint+0x80/0xb4
  [  153.613150] [<90000000038e9cc0>] do_vint+0x80/0xb4
  ...

This is because the unwinder does not stop immediately when
it reaches non-kernel stackframe at which point it sets
unwind_state::error. Add the missing unwind_error() check
to resolve the issue.

  [0]: https://lore.kernel.org/loongarch/CAEyhmHT6UOryPZi7eEfw01Y_CjAqxy8NM6eKkdvdojJqB9P7eQ@mail.gmail.com/T/#u
  [1]: https://github.com/chenhengqi/public/blob/main/verifier_movsx

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/kernel/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index aebfc3733a76..63bf24295e3d 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -65,7 +65,8 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
 
 	printk("%sCall Trace:", loglvl);
 	for (unwind_start(&state, task, pregs);
-	      !unwind_done(&state); unwind_next_frame(&state)) {
+	    !unwind_done(&state) && !unwind_error(&state);
+	     unwind_next_frame(&state)) {
 		addr = unwind_get_return_address(&state);
 		print_ip_sym(loglvl, addr);
 	}
-- 
2.34.1

