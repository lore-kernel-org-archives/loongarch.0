Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7894C9D
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778602; cv=none; b=eQ8bf1QcbgysSwEbVxzCZWm3B5OsGTlF3EylXgEOv/6pGOb8EREHa49dYdI3ff73PtQBwr4D/QZO85QmwuUJEUcegdH3xDC5tdDM2VK++bhkqe4qFAAbyeepAwwwa8l40OoyhoSjWDDGA6cz96cWQmGbUyYs7HtZjhlUw/+usBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778602; c=relaxed/simple;
	bh=D3bW53kccqh7kC5HvQO/ybJCH5XgtyaXneoTz1iI9o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQLLSd6hXOCkmm3gJpnKmFvlPkuEX+QrMsIbM5tr60FXG3gbWBAaBjWZkr37OvYEd4uMwEOHlIsXfh2SjLY113F8NsHT9ucSsENRWL4TpcgLdWtMFs3Sxxi/MBbw8sVfdwz8E1nDXrtNmAX4PRae5L5w007t7w8FBevzr4FW0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/zwG3aQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/zwG3aQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266d2d9eso741854a91.0
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755778600; x=1756383400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLc1SqMx88bxm5UNAuFakYImFc8qDW5ITO4vuXogwcM=;
        b=P/zwG3aQG2pOGAPG0TnienW42M2cIsl26PulPr2Rusb6jdjoaphGlY2KhtgfV49Yti
         HNiAKbzUekNpc6W+z4a/wAe62uUZIcZYdJ8rU0qGYRrbyih7tzW+RLd4fyHz3Dm1zDHq
         PcOiLwSoyxWc872228U0AfrZMG0+eMTPmoEWU9Gn8LuRluVW3+pm6jeipuH26wzo8qHx
         FKpdF/t0xRwTYCb5G236qrDqgWX4se7vJ2yx4M08rIMlFWcVS2kIxBDFPb8wom7R9pbz
         II6E3m4cqDBVUFJkLT7ottEkhLeKsFHoIR7kRNnQJ6q2yxMyKX7CWufbC2e7Q9r6Qd0v
         XLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778600; x=1756383400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLc1SqMx88bxm5UNAuFakYImFc8qDW5ITO4vuXogwcM=;
        b=ewZNtW/80+wRTVCnQEq5OT1MfSGuZO/NqWKHhjM0ls8V8FIa/uL9KA0f7DYeHpvjmN
         1BfZDKjAF9bhUVI0d6W35bYpWiGnRLlNhOHjNow1eJ0pVaDODgJVoSIfcyAgaaec2X7M
         dkhBp7cXiowbe8mVTRQb6MjE+rcZ7ZTYy91z8BHueZZCpBgP11l8SY9Z+jRyUPMI888k
         k9tnFmLoOIOsQh5ryPoo79qbzyzQBnlVfgfpmVNAeRbaiPYXTHF1/dMAjMg+hT4N60M7
         QI2tJWb5fis5LqtyhxgDKycpn471+TeHfp2UhM4AKhXLMWs7FnYc1Avb9Cs+3tZ6tr9M
         +AQA==
X-Forwarded-Encrypted: i=1; AJvYcCUEAyCpP1YQ3DCk0mN9iusDsJNMsIVHuPVChDP/nKwChU/rILzhGbnSLquHOxrJRQaCrQ1aIOhmH7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzcs1Md3LqoD6jvEtJBohYUj1e0feZJAgRCWDMu2ZK98G1t5sp
	Vnj+x5tNui5jDxh2Eu4J+kmPtqIabeX7srUEX4QzeUVOsBXobooS0A2v
X-Gm-Gg: ASbGnctV4vdKerICO1g2dxYKeiMDIYVgQDgX15GpVDfCvu2xfSx1gOcFxkWWIPIw0bc
	NImd6TefjuBzoKlAMSSbGNIYislA5i82QwKZtXmO9ueD3gkUjbXw+jBpCFPy6iPKIDlLT9NNq4D
	b8J0npsqX3XWtqoMz6BbxdNvLfhGx1ktPC0Fo6YOHUK4FKX4M0aVL81vzge+BajMhUVotHGIBt6
	7COdyvDAAF92UiSz68FQNT97KE3bqPGQ5T7TBLTx53QAQyY/BvcEcyXS1I0BTbt2+SBSBbPBGqI
	U1aBCsOz/cTTK4GclZJvEfehalfQhaFkIHofwjgNOa5BEPh7N+oAb0rfT3JOjrVfJO9NRthjDeJ
	kLESzXHpQ3NcF/kIJhdLmtnIw8sc/MAOyNLKrnHCRAQcntPuaIVA=
X-Google-Smtp-Source: AGHT+IHoaaMZA6T6APFg53tzmeaf2Zh5Zrn4FteT1P37Y2XdhOf2oT0PLT3bidCUN9QlazYmYrMhjg==
X-Received: by 2002:a17:90b:3d83:b0:323:39c0:8e74 with SMTP id 98e67ed59e1d1-324ed10c3camr3461899a91.24.1755778600188;
        Thu, 21 Aug 2025 05:16:40 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f2c48337sm1745442a91.25.2025.08.21.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:16:39 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	jianghaoran@kylinos.cn,
	duanchenghao@kylinos.cn,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 0/3] LoongArch: Fix BPF trampoline related issues
Date: Thu, 21 Aug 2025 09:10:00 +0000
Message-ID: <20250821091003.404870-1-hengqi.chen@gmail.com>
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

Hengqi Chen (3):
  LoongArch: BPF: Remove duplicated flags check
  LoongArch: BPF: Sign extend struct ops return values properly
  LoongArch: BPF: No support of struct argument in trampoline programs

 arch/loongarch/net/bpf_jit.c | 54 +++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 10 deletions(-)

--
2.43.5
