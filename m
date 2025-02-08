Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCA19D8A4
	for <loongarch@lists.linux.dev>; Sat,  8 Feb 2025 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739009977; cv=none; b=eDnQtJNtE1DamLTTUlFXW06V63u+ereWJHlRbN2UVTjt5j1UzAnroKLT1x5YbT8wdw1IsskEbl5l4O9a7hF+v4zt1rDaI89lSlVEAcTCiUgbbDlPXyUedIgt7onBNQqEDP0gWiiW+L697+JaYtrfkJPxpTFJ9Ba/yUZaaQmjDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739009977; c=relaxed/simple;
	bh=nl/UMAZyeMLDl9KNcnT4jDMNCOBQN+2wkdDP7C6aPQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ht8YeQ0nOohzXO0u70dYnkgXyChssld9nJanTT6zhc8SZZtHCw8gIdfzycYs6Dmtt0tlvVnKdE/MkMJO9TKJLvfa9/xk6mvyULdnnC2CDvxTY1gDLABzyLUsSCzCucAWv+QWFnO6GbwoAUWRbz/9g8OGEfmYZpqc+/AyJVFZ6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UzxwASWZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UzxwASWZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19410195e9.0
        for <loongarch@lists.linux.dev>; Sat, 08 Feb 2025 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739009973; x=1739614773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E52ub7AHUPwU1UhgD1WiD/oAb/xchvUZ3s1LGR5AR/Q=;
        b=UzxwASWZQk/jyyOgh20nZPgmGJMuu6WqwPCL4syFwk72v5hiRUosKGc2D0djfl8vJO
         DqTHOE17eM5qk0Zp5iGbnANsqYlXpaPmW6IOMH/xZKRhm/HQUS0v3kOoNMUQLP/M+ZiI
         N3o1n9iC6tmBYVk9crFA+Rxew8KgYEiMhtrkXqG+l6CHu6f5SOyTByJeqn1Uff11IoL0
         T0/Sz+HtVrTUPr5x7cns0ntcY6FjoCHTqgBStpK9C3uNNxnTqH6nCXuEwRzNPWibem0m
         Dl29qPzbBE0LEp3DvgQwe7+yMa7zvCp5OY2O94h0vtW7Ob2HASGGfPmTW8w2cbd7OB9A
         W6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009973; x=1739614773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E52ub7AHUPwU1UhgD1WiD/oAb/xchvUZ3s1LGR5AR/Q=;
        b=fEeZ+eKnhooHUiN/GBiymYM6LJplZPTVM8zNLQFtia19ih/c15t0VcSIVzFzM3P+zB
         DybKyCbHThUJJMW73zpr5PxW24O1kS17EPCzRCgepSVCNHIb0yDiOQQl8DJ4P5zNg1H8
         5PmnKxzPIG/bOloBTT8Y+ox0t8ljLD8hiQSTgOM8ae7DiLiT0QIXj9V3EZdkFWWCMI96
         Zo/23DhfIyWgIJ0MWMqbQR7EFvBgZEUmZ/sG8AtckIqPXeahIXn7Tpfb/vh92oFgSFwL
         5Pan4acBwRfC6wHOf2chzTSUZgTZnewI8IfwbfhwFyjPlJVowiIIc6cRr5DTKUNsWGdK
         a/4w==
X-Gm-Message-State: AOJu0YyQx9DpztcjDlT9iE9m6W3GEey440iI0LKPblmFTFPzyTDvHl4J
	30SEdSK143vY3XpwuVQyW3Q2yUthh2kcbaNWMjUmdJuJUNP5pVun14PHLinsjWaRdiDMXoZy+lE
	Ei3I=
X-Gm-Gg: ASbGncvWFoRfTgK0WXSZszmUfps3ImHFHzFkM+GEPtyjYTpFLc8sIx1CulyP4eC4QrO
	apX6oEtREOCqcYPCizhvQpfjIYO0h+b25NoBP8uRFPR1V42AsomUdFcgoZQHkhmny+JffkB0MAz
	y0r7SAI17HRZZIUwFc/aBeQmIDy3VrlnXMHTDW8gKfxrFj9Jo7gXWDa1od/Sy9x9GK2UE+ia/g0
	DK3BKFF9FHPiC64VHcBpQa634OCpxyV7YcjPgR6GBYPyQ7LQuoFU7eQgO9rkzFnPF8aW7GqLhyC
	c/KVl2LeeGFrtyDMP24StMsaDRgiX1d6OudoazM=
X-Google-Smtp-Source: AGHT+IHbLMa10VIqBv+a4WF96rSbHJEqAj2+w72AGx0qwl94J4A0SXsQrm/d3uwBwGUltUs98eaYqQ==
X-Received: by 2002:a05:6000:1845:b0:38d:b807:b894 with SMTP id ffacd0b85a97d-38dc8dc35c3mr4497447f8f.18.1739009973106;
        Sat, 08 Feb 2025 02:19:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3a9cc05sm1474057f8f.0.2025.02.08.02.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:19:32 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH v2 0/1] loongson: Fix idle VS timer enqueue
Date: Sat,  8 Feb 2025 11:19:23 +0100
Message-ID: <20250208101924.20743-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aim to fix issues if timers are queued because __arch_cpu_idle()
only checks if TIF_NEED_RESCHED is set before going to sleep.

Changes are described in [1], and [2] improve the patch further.

The following patch is the result of [1] and [2] combined.
Code compiled successfully, but I couldn't test the changes because of some
trouble emulating a loongarch machine; I tried to boot with and without
this patch, but a panic occurred, due likely to a wrong VM configuration
(panic occurred right after the i8042 probing).


- [1] https://lore.kernel.org/all/20230811170049.308866-5-frederic@kernel.org/#t
- [2] https://lore.kernel.org/all/06cf8750-901d-2f65-fb9e-81980688e017@loongson.cn/

---
Changes in v2:
 - arch/loongarch/kernel/genex.S: code improved as suggested by Huacai: 
	https://lore.kernel.org/loongarch/CAAhV-H6OKwmxhF_iWJEc8OEZ==h8dTdorTwkE8oMUMWAbU6xeg@mail.gmail.com/
 - arch/loongarch/kernel/reset.c: asm inline inside the while loops

Marco Crivellari (1):
  loongson: Fix idle VS timer enqueue

 arch/loongarch/kernel/genex.S | 31 +++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 18 +++++++++---------
 3 files changed, 27 insertions(+), 25 deletions(-)

-- 
2.48.1

