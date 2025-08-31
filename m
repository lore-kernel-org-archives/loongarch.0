Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999C273FD
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756691746; cv=none; b=X+tOpQ1bwYifKY+6IAuGlUYSQh2yFRq8eM38njAcE3cKTKCpd1/7qkTvtq1zSsWjSY8754M5kuQXMqirH4cXbQ0MVa+uBkL81bgvrDyW7w6LCuhiR1arVkTteqapEHUBAdIiYQhT4qz0Vy4oh1m2Gs5p030UBNUXVlJxmNOQYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756691746; c=relaxed/simple;
	bh=ZP4yuFRBXfI2HznJNG2cANT0Th/RYSZU3dgFdncgDZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s84Ax5PPGUoJlAE4PKfoX1JnT3m7ST91iJ6uSLUwWHlwkOxZxV+RlJ+uWuBy+KyMM1hb3EpT2+prTGQDjAgA5geh9T+aIfoSFSmwWL7Zd4FgZ6OEhdUFH+L9o/B6ZSd5RGpQvGHybiBPVRUfmDuU+93pRquiVrV5V5y3c5gjpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNIhC+Vq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNIhC+Vq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-248e3ef1641so24789015ad.3
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756691744; x=1757296544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6sjjWVGduqjqaHjl+ZN4PuaP3xzD2/P8Y4UY/ZnOsR8=;
        b=mNIhC+Vq6PPHdxQFeNoNl/K16vcfb2i6SfkRRJ7HeA6xXzJiFoDHyv49N+TZ8APE6E
         uNjJ5Bhn2zZjHIiJ3xScZwu0dFmEfK2MhxaPUJYA73vxLd0YVd0CrWS+VvcGRyMTB2ij
         7haNfWM2uwM8Ghqvrg8J8YwszN9s/TwK5wRPMth0zzIa4CF2xMOqVsh8aqOUUbs4UNBd
         c2G5wTSllKg9L7DHTiA9dJwrhELVBj9oJw2zmaxlAdxQuO36zrzJZEdPRTx7LB75rR/g
         Cgj5CTQtYp/QGRQVxZxQyPj07rh/mefX13lTWSUMDVocyZGpnXeLtqZMoeyvE8zfSJKs
         IAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756691744; x=1757296544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sjjWVGduqjqaHjl+ZN4PuaP3xzD2/P8Y4UY/ZnOsR8=;
        b=hYkDtAYdzEEgStHClX82GOGhLVHQ2a6XJYar0zz4beNadOuON/zWIJrVjRAqBt7dud
         xbJEeo/1pweitDBZncJ14V8rO+d7qaRuhHkiBzpuU5/6mKGYWWyTwfblE/ISU7J3NMwZ
         jG4TrWKLClQ9873+n6kvoePehCaAnKBoG2X17SdQuTfJ3KbQpTBqkmgmiurjQDwgPo/J
         /Xdv3qPlXY04HZ8cwnciuLMdgAJFr/h2qCes49jZfpw8eIMWD4H5a56RgJmYobFbBSJT
         bJTMt9F8g8g/B/XmprI0RZK+huaN+wCTO+K2KNMI5ab3kxX4qQV2xJr4eCK9en8KSvOB
         1lAA==
X-Gm-Message-State: AOJu0YygKt9wxBOhh5SuSMJPlYZqR8KmmeBG4yt8fN9nPVhGG114lS7l
	SDFCm91M0pLeqVr2Kbg75WCY0XJjUnKFyQ9HrAnxBoxRank6rDsb4U0u
X-Gm-Gg: ASbGncue43TIQkTElUUk04laBfm4rHYrp2fjKPXaaU9TzYNasJeMzpXctB/3XbHDOjq
	OUacEFXeP+KaFhLokz4Y4gRF38ts2tIJicbjZl6hnvvDQpnj4BiqimfLIrwEXP22ExYC1HfPTeZ
	kU3eDlZNFAFfOMoIJjbaCR8lcw3hybtuxJNCOOsZwoyzPqQDQRIhCuJi7DVR0hcz4NLIw9zLDX9
	aP7xDLbho0je0LBGyuzCCHtFn3WnoksXZ4RsUFEyDcWTJONbjclQBOvxUAdfolAtjf8zbO6dBSt
	lIRrcDYCepE3i+V/6zimKRK1bvWDATdDpXv+d9tCmcusEMVROIT10e88uvXaltCzwr3Mx8axhu7
	UxRPJbf0BQIzyDVqTh2+PdoGwNatFkcgWmIsdnZgq1n0kKfj+zQ==
X-Google-Smtp-Source: AGHT+IEgzBFAwTqQ7NvAC14ei5dOpNYIBZ7ujaqdrMJIi1kdNcbHeTBS6XjPhTLIh66RYEDMGFh+Aw==
X-Received: by 2002:a17:903:2452:b0:242:cfc7:1fd6 with SMTP id d9443c01a7336-24944b1ddf5mr68772795ad.32.1756691744251;
        Sun, 31 Aug 2025 18:55:44 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm8103034a12.1.2025.08.31.18.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 18:55:43 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v3 0/3] LoongArch: Fix BPF trampoline related issues
Date: Sun, 31 Aug 2025 23:43:25 +0000
Message-ID: <20250831234328.22440-1-hengqi.chen@gmail.com>
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

This small series tries to fix/workaround these issues.
See individual commit for details.

While at it, remove a duplicated flags check in __arch_prepare_bpf_trampoline().

v2 -> v3:
* Simplify sign_extend() implementation as suggested by Jinyang

Hengqi Chen (3):
  LoongArch: BPF: Remove duplicated flags check
  LoongArch: BPF: Sign extend struct ops return values properly
  LoongArch: BPF: No support of struct argument in trampoline programs

 arch/loongarch/net/bpf_jit.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

--
2.43.5
