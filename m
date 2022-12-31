Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEA2564
	for <loongarch@lists.linux.dev>; Sat, 31 Dec 2022 10:08:17 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 79so15517307pgf.11
        for <loongarch@lists.linux.dev>; Sat, 31 Dec 2022 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caYBi8+Qt+SIFvPenZGmyOkcUedrR0YCFyP77etiBps=;
        b=ggXAqQShudCniXqA622DYIC+fqJZ4fxh/7M8gwkk3zudEz6sXU6BMG/qpTlCz9iVf9
         LyAC8xKhe+ZWeNdN6sKaBNdl64bhn6iP6jfT+jd8c5nEKtzxtml5lXnILxrFU27rSWtA
         dtoJhLTK8jhSDYptWvbmswBXEzV91Szrg/qR7Xjc0BFKtnzYQEqgcVzdGvA/ALkcU7Ib
         OEggVL5HcXSkHl9fzlnLWjIQNWSTLdRQgxvys8utAdBdK6mywC7tYVwMU1G1rKgJaXSW
         bk7NtuSNCXdkO85vpYuhDYg+5HNgOgao5I5djdQavdtShkfyqLRbh4JonfoSCoOLQySf
         n29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caYBi8+Qt+SIFvPenZGmyOkcUedrR0YCFyP77etiBps=;
        b=RnNXUVia5Iz13CEQ3fxwC/LXRC0QURT5g2SfucfrmOhyPkIzsg+obHDNQYnWoBUYeU
         VzASPp4qZu2aDeiumdqqQrwkuTsL3xw9uPLROxApl9mZwBJYog4jtk+D6upISq5Up3Gx
         qqtDbtoLrI20OwRwyMksxFIA5LbVhv0pFFRzyHcbbJN83aRxKuZUjnPnNMV1sVKTKWuM
         7Iq6sSDXqI2C4Q1gmXD9o8d5Od+JSuy/mGMwMmeTJEe8+rJsnp1jOkmqeuOy2gAicf1D
         9nZHnfAlZZ2Gim/a3EPejUk5+1HXTMt/oXOPGtY5+gp9C/cShgCqCUjY9EbDKRhiWHyR
         6Yow==
X-Gm-Message-State: AFqh2krLnevCqgR6Ldn9cpKHl5mawOageQ9Gd297uLwfuqZrS0ieSlrK
	tUhdorX8IqEt4or4DAvZyEQ=
X-Google-Smtp-Source: AMrXdXvRFOm6/G6GqKv7ySNbOZE5KZoIFVQErFCPYzbVce40UFz38eA7bs8vxhDiPSTZLTKkh7HVTw==
X-Received: by 2002:a05:6a00:d1:b0:580:eb71:40f0 with SMTP id e17-20020a056a0000d100b00580eb7140f0mr27202693pfj.23.1672481297326;
        Sat, 31 Dec 2022 02:08:17 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.3])
        by smtp.gmail.com with ESMTPSA id g23-20020aa796b7000000b005811082f134sm10543679pfk.158.2022.12.31.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 02:08:17 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	andrii@kernel.org
Cc: hengqi.chen@gmail.com
Subject: [PATCH bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
Date: Sat, 31 Dec 2022 18:07:57 +0800
Message-Id: <20221231100757.3177034-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PT_REGS macros for LoongArch ([0]).

  [0]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 tools/lib/bpf/bpf_tracing.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
index 9c1b1689068d..bdb0f6b5be84 100644
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
+#elif defined(__loongarch__)
+	#define bpf_target_loongarch
+	#define bpf_target_defined
 #endif /* no compiler target */

 #endif
@@ -258,6 +264,23 @@ struct pt_regs___arm64 {
 /* arc does not select ARCH_HAS_SYSCALL_WRAPPER. */
 #define PT_REGS_SYSCALL_REGS(ctx) ctx

+#elif defined(bpf_target_loongarch)
+
+/* https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html */
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
