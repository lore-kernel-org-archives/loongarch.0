Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5A352FA5
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 23:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900262; cv=none; b=PihEUuO3kCwokk0KlyscNVUcjdmO1ETuRQRNMQgoPsfJ+DgGvH1LbpXa2dwIIT3hY0muKNS5vcVU58Mho5Yqb4u2BGilsOcbqsfVgbDnKA05G0qq5u2kIhs5eE6RR/RtRCzC1a+0iNMjwJwy4C0jK0dH4Px04whAriCrRTHro1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900262; c=relaxed/simple;
	bh=dO5ceCHRyFcG9tsPv/Uy5m+t2oSiu8qdhOWY0CG+Ixc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PLmP84cSkrVs3tie03cHW3DS9pJHOHIkJiDS6yV7/FecOQSujyBOx29ll/THVPa0bJVhA4udp4QUZEmk3CGvs6jOg1pp6ObpyjnvSR0vhxUBzv/kOlyKYxGI6wQAADnZowT+mlJyae13D37BcxIjLy/fF+O6DqWSe8wvBVEoaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/1CIW5B; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/1CIW5B"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c79662668bbso2287700a12.1
        for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 16:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776900261; x=1777505061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20Hp+mzF4LGGtn1pS9b/voWfhrJdUMGJ7yQHT8sztDA=;
        b=A/1CIW5B8vHZ2/3tpnA0/+Zp17jRAgzGsBYUvGtRULuLNEJvlz/tfkS8ZAgXZaDxC/
         6/P+8n6Dt1R5caQs4C9vzh5+/Ke8Fme5nb+y4RGRuu3rXZooDtmFdYoNaaJ1S5RAd+7J
         TJxo60UmTk/qj534AAeYzFXtT+BTkzWMBAUCz7hfiylkulGQPOT7bI3fxFvzObxOhsij
         LaflwY7jxYKcsJbb0O20KQSkJVcQf3txxYzSbRVV2kLnt0znu2lWxjYJqCuannCA/F3J
         1FeUfwVU8tB/asNuq+fulZ5Cptlm4rfafiY7y6DYHkOczhiNte4MZwGZ8Kqi6l+1Zy72
         YohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776900261; x=1777505061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20Hp+mzF4LGGtn1pS9b/voWfhrJdUMGJ7yQHT8sztDA=;
        b=j2DLganYydf27z/JnPfqjKYGE6uaW6fW0jsOFZncrPtkzwqNXvIfBxF0LWlbrAdwqD
         1sF4QL9vWEk9VoDcWUmKY+iiqzSkhi8H02ztMiZVXTSp4RVKjHZrV4CA6dZxHjbg9d3+
         ajzqUkVtR7rsY9c9z8XuaRVGEebZ8IXMAerzxUOkFwEBOzLYVe7YkcJ+GSwENUqSyAcd
         VUF9g7ysSW/XExN7KQ5qvEqPpaWZ3twIBRdbpTRx9K1sPTy1cDMXZOpnzXY0lGssU52Q
         ex3VMCrTDQBdJkJ5JS0Zs/qRYmEDWXCzXAxfXQsrozaY4+qYgX2hO136X3med1znUSHk
         MhXQ==
X-Gm-Message-State: AOJu0YzU32PAkItja9OXF4wwmQygOWYwlgmRzHIyBdaUKtTCDnVZjVbP
	RCVDktsnpgc++NHwcFKM/1zFHA8MtyqW9PohKXra/mMxMXMv9bxghCtJ
X-Gm-Gg: AeBDietB0KhuqtAkdcXGEMuz9KUzLqmir7TzrtBbvskmdZYT5z3KLhd2p8EgfcppkcC
	2AzBws1KHPBEr48lhwF4nLVsAGWVyyG7xifSn/oeu0MlEN2qlXwKjkZnkZbPHIkVH/ZkWnY2+S+
	aWdwUfItcP+73N1Wt7brXQcxXEryzzos/rENXrt+H8MyxjTD9fD7SwiHPlnHY3AJ2c39SBsiYLK
	kuBN4Y8KgOlUDqSWupmhXcNC9xMy7scu9Zi98i9qCcY8RL0KDeagShk3ZdKgRJz3VXo6jcf5Gqm
	ZnXfUtICBSJcGyDVCeHfukzpaY5S23fCRyh9+J+JFtG8K5jXCOHxEMRs2pqUMbh+K4btkgspGJS
	8M/ewXgUV92bnM4NfYqz6sCgGO7V9Bc9V0e+ZIDQJ3shRt7n2DvsRaqVbpJR5xy9yhtCbeNLsgv
	Po9XDI//z1T+4KdHPsCf8o6DZZnDHF2mioSjNqGogMKSsp6lXi1ytQ
X-Received: by 2002:a05:6a20:2591:b0:398:c0ba:9ceb with SMTP id adf61e73a8af0-3a08d6eb0a9mr27188226637.12.1776900260501;
        Wed, 22 Apr 2026 16:24:20 -0700 (PDT)
Received: from VM-0-17-ubuntu.. ([119.28.83.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f920e1sm13776248a12.2.2026.04.22.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:24:19 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
X-Google-Original-From: Hengqi Chen <chenhengqi@outlook.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	menglong8.dong@gmail.com
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 0/2] bpf: fsession support for LoongArch
Date: Thu, 23 Apr 2026 07:24:05 +0800
Message-Id: <20260422232407.3862942-1-chenhengqi@outlook.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengqi Chen <hengqi.chen@gmail.com>

This small set implements fsession support for LoongArch.

Patch 1 introduces a helper named emit_store_stack_imm64().
Patch 2 implements fsession support.

changelog:
v1->v2:
  * rebase against latest loongarch-next branch
  * drop patch 3, selftest is enabled by default
  * add Reviewed-by tag

Hengqi Chen (2):
  LoongArch: BPF: Introduce emit_store_stack_imm64() helper
  LoongArch: BPF: Add fsession support for trampolines

 arch/loongarch/net/bpf_jit.c | 99 ++++++++++++++++++++++++++++--------
 1 file changed, 79 insertions(+), 20 deletions(-)

--
2.43.5
