Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD035962
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901146; cv=none; b=QCkK7InY0swUv7PwNikJ9W1FmJx0jihKQZnb7arDUTnz4KVsybmTq03XZTziJgMpfJZPZPrea4A7VZGp6jHJkqx+/R8TICfOjhuSyverfcVQMCv0zOR8Ri89fjk7YaBHpUY+kmfSeseSwsoueYNfPzrODUrWSsJbBCfbzSvVY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901146; c=relaxed/simple;
	bh=f8N5DIYzoUBoEio1+AEddeH7BI1EjC+5LFt8y7V6Q/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XoSmiKMT9LG647Im/0GoMrBIPgQqirCqlwCKMElp56zOBbAfgRMuzF4r097rS8RgPnvFmOAdYCynP6D5X/m7114xtQ7y6DEUypY6OICulE4H8SGw+54aK/5SvIk7jrmUAH6PjUrA5XMen1p7u9OM7WtvMwp7EX6Mqwfg/gc97ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhuBwE1U; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhuBwE1U"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77250e45d36so2643433b3a.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901144; x=1757505944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Qykk0xQthpe0RRYOkXWUZrDmHJY/as+WNnOR6DEJK4=;
        b=ZhuBwE1UF7MHE6rLnP5AbPvK9DJ4yH7AG+58UhkIVHPwLnFtL8rSD1WKdZr5q5/VCx
         4IIZxQxo3jQp/jxOwI5RTxoX7xT8kGTtWkqBPxMPjcIKH259rC8Ujbccf7jR1mDjwzUG
         KjpDwEVzStz/q0bC5OVKFvGaBTK4mfHkkXXhwd8l9kAn4zJNR1yssNkO0X/KGfT1uZJd
         ObAbBchnvMuSUkSe8DiA3XiKaPjJjG3tW2TbC5yZx/8uNm3Xs1cQ4jOZ2fSEMwr9m273
         xSGrOrO2QEBXvmFJ3gXhW2olas9VCMGWsHI/jPf7rrmXICHd6TDlHyme66g4ZlUfpZsS
         f+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901144; x=1757505944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Qykk0xQthpe0RRYOkXWUZrDmHJY/as+WNnOR6DEJK4=;
        b=jwS10WrQ/A7JV2cjN/pC5z09SzBH9irFz2Zz22tND94R2Yjcez6NCXs5mwt22hgGAz
         EvVqumntjMKeWBIWZNEJbatYhb2wG1noGdhpGz3rfzDFVGuF3bNd3W2vAHZrevv/g7p4
         /wNfeMeEYIRSbMbneLkAFFqMdF0ewc1LxzUphl4DKtrF5VGjHwrfK5Mqt8500qqUt+RN
         PfhjX2XwzIFvruuhxFzJrpnxaUO/xqjR/u6cFJFmrCsgwxBNSwBK2qaB3HUWfSv2p+lB
         XKFRou5kCEbbbLQvS0Dg7FJrAwSHO43ZD40nMEh+4VgJZyQBV3nmr7wsf4qUXWJtGNDd
         zL7g==
X-Gm-Message-State: AOJu0YybS9eOsAyeSRhX7ONLaHubYUYIwiCQuxivG0Hj8Lo7ry9YIoVT
	G7YrvQ36f1meF5PyV4/1IsvDUiLLJGnvzlbyifvz1UkubLa1sJylzjxD09L7y3HyFRw=
X-Gm-Gg: ASbGncvXbQN6dAJatjuIHG1/oOJxXOSASHNx4oSvf3LdrttfhoQUV7CAqpoWmLlXGnl
	cGW1D1nseKqp6L5stY7Y19hPAjzuOM6agzfoSnJOHj+lhtJ1UA4k2DSQZTO8+UO1PBk8U7jjDoy
	84L8BH88AQ261OC9v50fH2QWzsTyiBUlOYvvRnAa90H0+4kMtbS6YaVgwq19acrApy32ZzNo4bE
	HhqctBB8PX2VX2CrHK7uKgRcMqhTmY8yuViFo8BP75MMjaYivqBuaWGhkXPIRRVk/Oy1Agotx2o
	MWJOZiPtypyADK1brIanEmwwCk+stKfzWz5W1ecQRdjrvdVk/eQLlC08xB3CrTMen49wsqaQJhe
	ILot4aBD7N+tOQlQvQxL/JLWBoIn9W5pKNOU9wXA6TXO+uy8R79o=
X-Google-Smtp-Source: AGHT+IF9pVOHyDnykUAgAHhoztq3yyto5TS2UIr0a5IaKVOEo/rPYlHUXdNXwZG9HhNFzr/X66iUUQ==
X-Received: by 2002:a17:902:f642:b0:248:6860:80dd with SMTP id d9443c01a7336-2494485d541mr217919425ad.1.1756901143664;
        Wed, 03 Sep 2025 05:05:43 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:43 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 0/8] LoongArch: Fix BPF trampoline related issues
Date: Wed,  3 Sep 2025 07:01:05 +0000
Message-ID: <20250903070113.42215-1-hengqi.chen@gmail.com>
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

v3 -> v4:
* Completely rework of previous version
* Fix more subtle issues

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

 arch/loongarch/net/bpf_jit.c | 67 +++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 16 deletions(-)

--
2.43.5
