Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A18B2DEA72
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074145; cv=none; b=dfiail4PZClmZD7JWTzppHePwUq0IMLFtogf3/kmaheWy+4m9Z9/ougLq5dKp2+TlNjBJYERoQS6B7YS+o+njWmifMM3gM25WnedyJejGJ2Ky1PUJYZs/PtMM2aHaUcEjvoiQmL60RR2rJaeKZaKeROQ9ndCmM75ZOFfMZm0LcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074145; c=relaxed/simple;
	bh=BGFE+p5DigdVs92ZkLlcZk3UVXbN6PVuRDNovY63usc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BExIjqt/t1TVi7kovuMb9Y0wiR0AwNxQj7yyp7zZMqAQVmi4KDuCSw4j3ZRzYPKqxOWdsrXZgofq0RGPOWLo827Y9A0lkwkOHssNnKGVEea1rB3TZmROAM8AHgtQGdO8cdGLLRsBmel8qsZr4N5Lp+Y91RfPq0zAuW5S6dN4F84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9Pbci2N; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9Pbci2N"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266cdf64so5320674a91.0
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074143; x=1758678943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PQe4xHtTsROTDkp1aihG2tna4AogIvR+KAUvItXOO8=;
        b=C9Pbci2NkCxCxd/WuX+0M6iudBSRnua6TOq+Tayrw7Dfq2A0WqDmOrDIXdfrXPFVNF
         pAwWO87s67/1tTL4os1xZWFXPkOigkxkkD8E8bm88JMbl8+0+5zVUFOY/dtpXsk0IceQ
         qRKdAH3q0JRoyU1iT/MueuLnVVt/Ewvg/U+1pbtb9cXMf5Xujx61xDJonwmb12pHtuHs
         mISkapFI4t/GRLbI7aaxHNcCGq7M3rjtalds5MJN35lsTtwdYSxClzYNugUMss476NSl
         KGTUCigx3d2qHk1OpMNef5F08DygdvYrKoCKKhmFZZ4nZ/LTpwKZXuo1doxFZmDmn6hN
         chaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074143; x=1758678943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PQe4xHtTsROTDkp1aihG2tna4AogIvR+KAUvItXOO8=;
        b=mBkX5hoNXnDcfz4GsDdwCCB7sCnPp/Psl+MYZqq4+m0xz9dmJC8APT03GosXns1ut9
         sKEElDSHNPRacgr7/AsisTs6xr2ZHhMROwGxoXY83ptJicFb7V98aeXIa9DJ58Cl2HbA
         /+rg7iiNmJskdur0h9sf9HpOH9fZ316cBFJNhU0NXsFvOwuAPxb9J3A2Z1RbGQ8zSwK4
         LZeVaR1xUZtFH9JJbdTfWkA1lObsOiznGtWBzuHF4PlxCkvpnF820Ofh90yIVuclZhxm
         akVgf46jP7b01HpVuatyhr4x0qucjUdQRh1x1rQ2oHs7zZOK+rGSE8c9WILI1UGsjvLS
         cQ0w==
X-Gm-Message-State: AOJu0YxzKNp1E3xhCtFqhGaYtWbbS5WBGR2m1Fq+y7P+SyYUhPfsEE0V
	t3BfmKl8ro/qxUyw448OKwwThIfBL93zV4v/w3pcALenBumY5ua1xOnV
X-Gm-Gg: ASbGnctQRHt2vMHoX2a1+L6QLyMrNzAoeaNlhdd7RqRjt2j0fXOeNcL5lCZJNTihTLd
	bYHRIqGAfuMRtqDup/LMzjpCqlIDG/DRN9DapxTQE244QtCjbgwj3nrHA1x4V57BU/EQq04CyTj
	kFlL3UIAXF6nE6GTpHbqcmrkC74CCeK9I1dftSAppqQrlkZxxWZOVFNa4V08+tODvYfY4OjeLZZ
	UfzVZKhBN/B5kavoby0WhXCsALyucpM5GXz8KQH6FIRkfP6TlfDcsA90xOdM/o9ofWjHCwfKQg/
	IbepsibmjJ099nehWebxGuAi1ltin1cjOVzNeCsXSZs1cE7Uh/Dhx6ZylqafMhzoQIVFCen0kzH
	YYtUqzdEwyNxX2Idxy3q4TV6G0fVxG762Lq4YKqM=
X-Google-Smtp-Source: AGHT+IHqqK2wUrlor1fpCWgNM1tuaVBLsIfFaalxAjaCvVXSL7VSuuJl2SBc1+Dp7s33Tjo08W6zMg==
X-Received: by 2002:a17:90b:4c12:b0:32e:c6b6:956b with SMTP id 98e67ed59e1d1-32ee3eb1caemr580685a91.4.1758074142872;
        Tue, 16 Sep 2025 18:55:42 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:42 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 0/8] LoongArch: Fix BPF trampoline related issues
Date: Tue, 16 Sep 2025 23:56:19 +0000
Message-ID: <20250916235627.102831-1-hengqi.chen@gmail.com>
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

v4 -> v5:
* Rework sign_extend()
* Add Tested-by tag for first 7 patches

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

 arch/loongarch/net/bpf_jit.c | 71 ++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

--
2.43.5
