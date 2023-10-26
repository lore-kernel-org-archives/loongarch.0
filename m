Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7518C01
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrlU/+lK"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27ddc1b1652so1485761a91.2
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386479; x=1698991279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zelpIOoWAgGbxFR3NcYgOUoojFa9hIieRbhvyFBjF8=;
        b=SrlU/+lKowMpAguUqShC+CyvxLIdhsePZ8sq+jWpLLS6n7ekt++zPx51Pt88YcoeUK
         rz3oXv5WUma4GWDNCJvQYQOn15YxM3D3YfSv0OMDx+l1PbjdB9TrfTMA7qAlpzDdyZtD
         7DQl1vCZ3IS2YBg10umdG/HGOWbqaQVjz0kyaomY85eNC5Mc8N3qC0DvhTBLPaS+T+pA
         Tr4B3o7OCzF4YTXCBOkXeCOdjnxicBSZh4Y8UkBqTVTss/o+Nmp0tXgAsBYWuB8cEmcB
         Cis0pE2a0VUvVkM/thyjG/2irPXQPaB9HYztbYvFMRP8U0k9bG3T6Q2bLiE5HMZfeHtc
         TxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386479; x=1698991279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zelpIOoWAgGbxFR3NcYgOUoojFa9hIieRbhvyFBjF8=;
        b=r9Gz5GqRpJSsRWxXcVzoFLGe3nWYLEvM12mjCjOrM4ClEzbk0wAs3MQXTJFHR3VHnr
         aqP1CaffEY6dY3P9dqiN+nT0R7yG6xmrg1FtTfqeF65JEGQOdlV4rJRxGlL3hk71sbJy
         bWx0N+d2Yxf1T8NxQR2VG1ggRTwLP5DO5RdH+/ktkYE7kjf/1M6MV8YxdSlWaQWkbCMI
         SsHXCKSpww7/peawukxKiXQ/J4MI/Y5BxiR5cL4LOOQmRPVgyPdLIbJRFLF6Py4a4xYj
         8LCZUFOoZ759iHJYiSE00q0i81H+haUlHLNGNQsZf5N6Y6xbKHKsnDSXf8kakWHkaVkt
         aeRQ==
X-Gm-Message-State: AOJu0YzpnFYkkKn9rtQYRZm9oIm9q/n1MVi4m32Z9I2AOETAQTN5h+Md
	DQRWxhK3HY6bJJ+DbiDK/vVjJgVUYzEcWQ==
X-Google-Smtp-Source: AGHT+IGbB6lqmvFnNAP3CD23VIw7yN0hIQByt8lNkGolnRtThjkjKWvfJvwwOVugZSO/BXqfROSkmw==
X-Received: by 2002:a17:90a:1a50:b0:27d:3ed2:86a5 with SMTP id 16-20020a17090a1a5000b0027d3ed286a5mr1572448pjl.33.1698386479701;
        Thu, 26 Oct 2023 23:01:19 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:19 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH bpf-next 4/8] LoongArch: BPF: Support unconditional bswap instructions
Date: Thu, 26 Oct 2023 18:43:33 +0000
Message-Id: <20231026184337.563801-5-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026184337.563801-1-hengqi.chen@gmail.com>
References: <20231026184337.563801-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for unconditional bswap instruction. Since LoongArch
is always little-endian, just treat unconditional bswap the same
as big-endian conversion.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index ac9edf02675c..a8be6d4b058c 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -731,6 +731,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		break;
 
 	case BPF_ALU | BPF_END | BPF_FROM_BE:
+	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
 		switch (imm) {
 		case 16:
 			emit_insn(ctx, revb2h, dst, dst);
-- 
2.34.1

