Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31731D72B
	for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617714; cv=none; b=OMfBdKXbONFxp3t78QZQE+TABce84lYwVatilHg52zAjrRx52pRZhh5v78ePirRpjsVHsD+/l9pi6Is007+aMFeDIchXCD8Fu0k+T8/jdLY2Jxt/0HHqrXTsrlGZ3R38bJ/Rm7TEJ90PqUEsdTdkNomiuploxZMFim/iYsCqtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617714; c=relaxed/simple;
	bh=6uznfjVFOqsey2trDbumcjSCV4htTcNXEKu2CRzGT2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpXafnxBpMT+um8q4iNOetfolimK+NLmayZK7D1SqW8rSr25GB9T4IgkZ47QWd5UMncrDkh9yT3jnsy42wyCdSjAU2C6Xi/VYLw/CCvWCIQEAFQPTur6Z9uDmntnQpEcFmNESSZuyGH5Bc7niSmKfAhDSPb33xP/7QVTt0j8EoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU5As7YJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU5As7YJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b54d23714adso4156364a12.0
        for <loongarch@lists.linux.dev>; Tue, 23 Sep 2025 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617713; x=1759222513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CU8pp1OSTV21bWaYZnE+gTdPy0lAOEVzRahpQr0/JCY=;
        b=bU5As7YJFpNPmOeGVUObOgemirsQgobct+qKjSFRJFHyjtGRiipB8tn3IaGBdRUdxH
         t6oaeh0lCVwR9osBOPiOUCW2nenhlsjS0Tbu8eoFlsAZnZyMWiQtDbnXxzCMw7t8V91n
         J8OPa/DORAj5xvrGTnHZ2XlBvP/Z9ZATiS/c/gi9/R6SYNrwJNCV/fe+rns+cGSUvY6R
         v/RD7bIOQImsMxL6QnvRTOpP3FNyJA6wo0s0CAef89wm/DzLzI6qdfZAc0ggVSVfCUiT
         5tHI+As64v6Og/fEc5GDGdUhjuJioKLmL0IX1qK2azpmbjJjNxpsu/xGUKbQyAIvnO8N
         B83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617713; x=1759222513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU8pp1OSTV21bWaYZnE+gTdPy0lAOEVzRahpQr0/JCY=;
        b=NLqG7r8etMk5DWsKCEC3EnP7voVePSi7qg5/hY9IyZ9ay2Jhs+l4BqB/YUgGX2hMuY
         ZUc8yfxHGDvc+xBvoA7toQ71tetGTk0IilRK0FdypLoiqCjXSLoG/w+LfIeQkpS8gUw2
         rU2HkC2jTgDjIXMQ4XkGLPFGBxLAiFBwl/4mDnOMzeT/WmO8aXMr+Meat8S89MyJP/1p
         pZg43bVKxsKOJ8Nzc+tiKnvOYKt517kYMoNN1nsSwWIyF+TYdXP9QHnZ6RYwDEm9pl+7
         1PNBmUMAekzVvLOYTBDFVOZNVRQ4R45gVuS+tQ+ZmGvGQioNRlpaD41MdrYcu4ciYo+y
         +Q6Q==
X-Gm-Message-State: AOJu0YyQWn12hitOlWxk8mUFj6C5W6EPLWBv+KNFvmnwR6foz5iHq4jo
	pcvRPGlCEf278TOV4T3bvWKHb64oxUiwt7+rZLXsDWxk/HGgSkYjGm8BsQ386q0H
X-Gm-Gg: ASbGncsSysXZb3epHpI6OhL87hcOQw2q0ourAf8xnbc7vObl1wcpIBL+DIZWJccYXQU
	YodGfVfRGMZsqb5/zC3yJ66M9ATSyYqLJSQICgMMyI6Ow39V8aPrQAFqiwHQVDaXOzK0AlVT9RD
	L6QObY5QJLh8DO82SO2W2NIRxNPhN65sv+RlFG0rOvQL3bNTDkUz42Bou/9n4kjkX1yBTk0wCUM
	BV+o9nZVmLGgsL5KGYkpNsl2HH0tJQx1mAkCw8EiYqlfWppuC4n5T1D8D1Uwa2NrL1ylrFMW7U/
	TgnRcnVrnf8XAErjKdZsRN67VnhKH7fWrDHZH/vUTD7OceBI0TsJKwtBMtpACnKgYkjDl3xd8Mu
	DG0rmkCFMlo9gKP0ZpWqAw5Xld7u8gw==
X-Google-Smtp-Source: AGHT+IHX2dcDzHiTxOXABoQoNFRZUozJnW33psPzSrOEr6zSOeCd85lDo6LNkKd9anI94GHqE17SxA==
X-Received: by 2002:a17:902:f78a:b0:269:b2e5:900d with SMTP id d9443c01a7336-27cd63d1c9dmr26278605ad.5.1758617712199;
        Tue, 23 Sep 2025 01:55:12 -0700 (PDT)
Received: from devbox.. ([120.229.24.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531c6sm156676805ad.14.2025.09.23.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:55:11 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v6 0/8] LoongArch: Fix BPF trampoline related issues
Date: Tue, 23 Sep 2025 08:54:41 +0000
Message-ID: <20250923085450.140602-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following two selftest cases triggers oops on LoongArch:

    $ ./test_progs -a ns_bpf_qdisc -a tracing_struct

This series tries to fix/workaround these issues.
See individual commit for details.

v5 -> v6:
* Rework patch 8 as suggested by Huacai and Tiezhu

Hengqi Chen (8):
  LoongArch: BPF: Remove duplicated flags check
  LoongArch: BPF: Remove duplicated bpf_flush_icache()
  LoongArch: BPF: No support of struct argument in trampoline programs
  LoongArch: BPF: No text_poke() for kernel text
  LoongArch: BPF: Don't assume trampoline size is page aligned
  LoongArch: BPF: Make trampoline size stable
  LoongArch: BPF: Make error handling robust in
    arch_prepare_bpf_trampoline()
  LoongArch: BPF: Sign extend struct ops return values properly

 arch/loongarch/net/bpf_jit.c | 72 ++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 16 deletions(-)

--
2.43.5
