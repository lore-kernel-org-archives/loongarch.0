Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E27B
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 09:48:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y1so13594629pfr.3
        for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgN57VsOmEbW0oef2R7lDWd91i+seWCcSmuwkn3qm8s=;
        b=CXpoZkphNnzb3HdWkvbxbX+OdQIuzsEiDKIALM04EGdA0N5wGbiAERk0wougKpWT7B
         ZYPyDYdtKD65v7HlfNRkRhb9a5c/7Qs5Dt9bFQDUqTyBXIIDG57SRGr+H1igaqm4O35U
         nkXYGwJLT5JP7o0fjJn1V1eRGDGTnjs3Co0Ydp+Fe87uScw4Z43sLrfd6OoHFaXaYeKd
         KQ5oa6fXbGltBKCDCreI3T9P7zeZPvoeBW4dYGcN/qKG9JDmkgFuS5BqQLuA72jt53z9
         B3UwHk7OSxxM9gCqhwzpCNhupg5xGuNqWt1fxhcQef3jC2qtTqJOtZAhfPjoJjBr0TaL
         bOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgN57VsOmEbW0oef2R7lDWd91i+seWCcSmuwkn3qm8s=;
        b=JFoPIh+ZJfd6z9IUM9hhht4NJubx1NeAGXCZ7NN+h9/4fCM23O5rcR06IZRxKpvOVV
         h7fGsTNnFo3s/FMybreieFe86NrbTILZUGudFrYrmxBe/yw0hG4k7SNx1lRcLfkZQ3k9
         V6PZO9wNGBip32G2s27orhfd70J9VyQLlKUlDlUGvlCNksL7VYno6N1tFpma40FmBE88
         RyAaK6Un5eNb+dhcD3I0d4IFQNxMYgFfyjpNfA2TdcpJgoQiQkAiJdWITnVQfysiyku/
         EtG15+LtyAun5kTpulD/Lev+fZXEztfkzYsZD6M6nyaI+aLM7HUubP0ETFuljHvB5gmd
         2aLg==
X-Gm-Message-State: ACrzQf35lYqd0fYQ7Mn28+Xr1u9Vq4ComKdfWb70ERlRz9txMB9ZU2vM
	AFcaC0N68uYzd+XgR8ZHx+w=
X-Google-Smtp-Source: AMsMyM7YrZlETnFnw/Z85QePmZIRib8ilbCH1b/A+iimOLBUdYKd0zLRQzbpBTayU56qlrjADefY6A==
X-Received: by 2002:a63:8549:0:b0:461:3995:60d1 with SMTP id u70-20020a638549000000b00461399560d1mr1931790pgd.105.1666086488060;
        Tue, 18 Oct 2022 02:48:08 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.4])
        by smtp.gmail.com with ESMTPSA id q19-20020aa79613000000b005635477c42dsm8775730pfg.133.2022.10.18.02.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 02:48:07 -0700 (PDT)
From: zys.zljxml@gmail.com
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	oleg@redhat.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenhuacai@loongson.cn,
	lixuefeng@loongson.cn,
	yangtiezhu@loongson.cn,
	Yushan Zhou <katrinzhou@tencent.com>
Subject: [PATCH] LoongArch: use flexible-array member instead of zero-length array
Date: Tue, 18 Oct 2022 17:47:42 +0800
Message-Id: <20221018094742.324576-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yushan Zhou <katrinzhou@tencent.com>

Eliminate the following coccicheck warning:
./arch/loongarch/include/asm/ptrace.h:32:15-21: WARNING use flexible-array member instead

Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
---
 arch/loongarch/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index 17838c6b7ccd..7437b9366c3b 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -29,7 +29,7 @@ struct pt_regs {
 	unsigned long csr_euen;
 	unsigned long csr_ecfg;
 	unsigned long csr_estat;
-	unsigned long __last[0];
+	unsigned long __last[];
 } __aligned(8);
 
 static inline int regs_irqs_disabled(struct pt_regs *regs)
-- 
2.27.0

