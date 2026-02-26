Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5CA38BF95
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089211; cv=none; b=AC5SI+4ZGFrUCBprWkSg7rPy46nSkRhzluyTDLZttpSIh8g6Sh8vQ0qi2aw6oYllD48JaJpohhqnz1DQlWjMT61lVmLj4x0ejYg9iJ5Q9ElaillkSGPt+R5PxOlRREHWa0WNpiRtgRbfPp19RI30kIwbey0rg37rEM0BPfhm69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089211; c=relaxed/simple;
	bh=HaOp5S2Up4ZXb42DQ0x6g1k4kLj2jSKwCVm0W4NrSEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kpzhiWknoHuF11sHSnRTx1wy35otOCCS0JZG0h8/RWuxOHXm+ceX+XfuqIPcew7DpoG48SfQ2g9JnXt2RkCf5YM6l3I2qoz0Lo+togMOjXlTOGXGKKdg/I95Of74zodKLDfNNQi9cxDHEObC4xzgNUkpHPeDhGexI9LptsEkaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9+oWsUY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9+oWsUY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so5063755ad.2
        for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 23:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772089209; x=1772694009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+96CFpWbj6Qbpn6gUigdKA419a5gSrz/9u/JlhQxNo0=;
        b=Y9+oWsUY9sA3fBTYPweLibznh6YH3YT6mrh5KbnxVD8uD7G+RRjCM0GwcLc5I15fC/
         YcV4UsTFCxbnoz0WZDueXHBj+RHNZajGMPVmtE5h68qG5eNVx9TTyN+RclmKPEq6vcCi
         /VyRX8+yE7KKoJOm25xOSF4zu0aH7MTl/ek8woySBAfpu/OstAh6Ui/4GtgIFleoX7a1
         3jabUOHpvvEw2JfPiOwM+hW1SA9oukk0KpkP79gwH4Oh2WfeJK9HXXgoFzf1jUufP5Jm
         FH1Omd13ScKVn9HtcqGYXEk/0h6EZql464sR8BOh3w1mAw5KkPZKQ7PAFKU0LfG/JmdE
         AOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089209; x=1772694009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+96CFpWbj6Qbpn6gUigdKA419a5gSrz/9u/JlhQxNo0=;
        b=UvrcUxhrdikMDntFiuUfxkuanDy0iDv9HIZ0JDhwt6oCcqL9onjInOadUcT4pBKJaR
         8f2a2Orsp6iR2ikNF4wezhkt13PktypFZh74m551h1UmQlUWZDa/LR3g5P8Tud8BYHvJ
         FmlQx12sfnAreFxip/8SogIUaptWwAejhcUT3NihRaBbSq2/K06FGGUxtYnFvlu3RoW9
         hGjmdkZvo2B6SpKfgOj9K6i8sDofkpGbe5DnVrxT7s15RC0+ZVV5BzrX/6x+AJ+oL+61
         kVeLxHlxF9nsDiEc49mHKzavCxbEgSG8tHhnyKxUcoKzavXiozk/6tRAGW/vWKyrAnAQ
         Iu0w==
X-Gm-Message-State: AOJu0Yw+P3+gvtM36m8ndzFsdP1lQ1JFUb2udMQ7cvKgicdsIPoJ5adz
	95yzsEcfSGnXdlpSElEYYXO3PYNdT5W36So5iJykEs9N2ZWL2Ad149V8
X-Gm-Gg: ATEYQzx+yzepFaR48xGBHy4utiPwYkFNf+U4fULwHnXC+3s3A70LwJ/bLp2v3vt4AaO
	IvqLIS7byqpD+mu9XFqxCgGIr26jMRK6YruNMaaY3gBwagAFKQXlLi2FdL2e0o864Okyb7Dq+ba
	Kzn2TBAqERV12Bnng3UFIsfkgEIf15Bfn+qygWvUyB3e00dn1SMyhgNfK+NTWnRotfMRy2CAzQL
	AiWaBYQ5e7uW9gSTgkhqANl+Ei3LDfxGZiC+DlsZg4zBnT2tgkHoTQlQRHRxI1mHcayCY3DJ/kt
	6FB2mOjGPkdeoN3YJDJqyH8HIES8fpGg9YW+tE07wn8YMtcnDZD0TmNDzeuC892pEk96X5s23bG
	1Qcq/hwn2Y1pSkdWGbUTyzmirxB1Zhn0wQZzUxxtebdYK8pghzxA1GelNDhcJDSpJXkPBAReqHJ
	NG4+h39VzHF1W7P1cBKegoj7Sj15ZaDTjIxX61hKmrt6q28HoHtMz/z0d2e4c=
X-Received: by 2002:a17:902:d4c1:b0:2aa:ecec:a442 with SMTP id d9443c01a7336-2ae034921f6mr12871815ad.40.1772089209454;
        Wed, 25 Feb 2026 23:00:09 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.35])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb5b2296sm14803135ad.5.2026.02.25.23.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:00:09 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	menglong8.dong@gmail.com
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 0/3] bpf: fsession support for LoongArch
Date: Thu, 26 Feb 2026 06:59:48 +0000
Message-ID: <20260226065952.4082859-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small set implements fsession support for LoongArch.

Patch 1 introduces a helper named emit_store_stack_imm64().
Patch 2 implements fsession support.
Patch 3 enable fsession selftests on LoongArch.

Hengqi Chen (3):
  LoongArch: BPF: Introduce emit_store_stack_imm64() helper
  LoongArch: BPF: Add fsession support for trampolines
  bpf/selftests: Enable fsession tests for LoongArch

 arch/loongarch/net/bpf_jit.c                  | 100 ++++++++++++++----
 .../selftests/bpf/progs/get_func_args_test.c  |   3 +-
 .../selftests/bpf/progs/get_func_ip_test.c    |   3 +-
 3 files changed, 83 insertions(+), 23 deletions(-)

--
2.43.5
