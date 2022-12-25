Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B19880D
	for <loongarch@lists.linux.dev>; Sun, 25 Dec 2022 12:01:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gv5-20020a17090b11c500b00223f01c73c3so10701642pjb.0
        for <loongarch@lists.linux.dev>; Sun, 25 Dec 2022 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWvEKeZXI1rB1wz3yUyFiGe+8/2+5HAKxZsLyUNZlno=;
        b=F+zdfPQR6vsSBibTfE6kkHg6FYweaExEu2uNbpjezGOjxWMBkSJAgy8PfxURbqGiCk
         6VCl+bT4VcJp38kSlkLXXNAPYEy/Wkz8223FQFxyb71G0QcDduYont1cjRsmJ+DPCRRZ
         2JqGvAHqMfIGyFeTqT3Od2YgOcWpDYE0F0wxmWrfLpSqLVx4TQhr4GzcStR2oAslC6t/
         ZbNk5nmQ624f4+SOe01aox+onp9uz4zuLJpLD2Pv0cIDxM1iFmVKS8IMGdhhlFWSfGgs
         4I5XLmIIQXA8fygPJsTlGaTGVQZ6pdGOxy8CNLmSNIiEhFlX3eO/JRSU7PbSNzzn4Pxz
         IAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWvEKeZXI1rB1wz3yUyFiGe+8/2+5HAKxZsLyUNZlno=;
        b=N2EAWx0Q6rpxhW4zbXj7yJXKljXH99pWiRMhd1Ob4J1PLCBv3+1QRixmWW9tlfzgAP
         DNn4wIcoPRK4JUAXgLU1RLg0svxNVOxkFbHQ3O1pCHNfGL/p3iEtcKKzTGuX7DaTsMHO
         m55rlwjHsGM6LzU3GuK9jP+y9qEmW61kqec7l/Xfq+W8do0HmOyom5uEmL5TzFmq+BeM
         10vl0Fj6fx78aIkOJqOSbXO4ycsWFPZRaAoX8AjStG8+0/ATT1M5N/9HVG1l6KLMZBrl
         qi4KyvoUuIhTsSCofzA5v7aE7UYfqSR7svkP0fZnxCqGDnZFrZrwkW3O/p3cM4+dsdo5
         /slg==
X-Gm-Message-State: AFqh2kr7SBoyxLCrps8KD1cn42pBOG01xbwsvhmyeHl9rkOwuuh7OwLC
	07SkiAufDj81OEEJMqlZ750=
X-Google-Smtp-Source: AMrXdXvcrjqsvadp7m8/4f3hc5XK8N4cUHd/W3kWoBZ/wVAxPDo+U2icvmb0g0lmQgiFStSQECgTzw==
X-Received: by 2002:a17:90a:4ca2:b0:21d:5e73:d562 with SMTP id k31-20020a17090a4ca200b0021d5e73d562mr16983369pjh.27.1671969718275;
        Sun, 25 Dec 2022 04:01:58 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.8])
        by smtp.gmail.com with ESMTPSA id dw6-20020a17090b094600b00223f495dc28sm4797766pjb.14.2022.12.25.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 04:01:57 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	andrii@kernel.org
Cc: hengqi.chen@gmail.com
Subject: [PATCH bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
Date: Sun, 25 Dec 2022 20:01:38 +0800
Message-Id: <20221225120138.1236072-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PT_REGS macros for LoongArch64 ([0]).

  [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 tools/lib/bpf/bpf_tracing.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
index 2972dc25ff72..5a8a0830d133 100644
--- a/tools/lib/bpf/bpf_tracing.h
+++ b/tools/lib/bpf/bpf_tracing.h
@@ -32,6 +32,9 @@
 #elif defined(__TARGET_ARCH_arc)
 	#define bpf_target_arc
 	#define bpf_target_defined
+#elif defined(__TARGET_ARCH_loongarch)
+	#define bpf_target_loongarch
+	#define bpf_target_defined
 #else

 /* Fall back to what the compiler says */
@@ -62,6 +65,9 @@
 #elif defined(__arc__)
 	#define bpf_target_arc
 	#define bpf_target_defined
+#elif defined(__loongarch__) && __loongarch_grlen == 64
+	#define bpf_target_loongarch
+	#define bpf_target_defined
 #endif /* no compiler target */

 #endif
@@ -258,6 +264,21 @@ struct pt_regs___arm64 {
 /* arc does not select ARCH_HAS_SYSCALL_WRAPPER. */
 #define PT_REGS_SYSCALL_REGS(ctx) ctx

+#elif defined(bpf_target_loongarch)
+
+#define __PT_PARM1_REG regs[4]
+#define __PT_PARM2_REG regs[5]
+#define __PT_PARM3_REG regs[6]
+#define __PT_PARM4_REG regs[7]
+#define __PT_PARM5_REG regs[8]
+#define __PT_RET_REG regs[1]
+#define __PT_FP_REG regs[22]
+#define __PT_RC_REG regs[4]
+#define __PT_SP_REG regs[3]
+#define __PT_IP_REG csr_era
+/* loongarch does not select ARCH_HAS_SYSCALL_WRAPPER. */
+#define PT_REGS_SYSCALL_REGS(ctx) ctx
+
 #endif

 #if defined(bpf_target_defined)
--
2.31.1
